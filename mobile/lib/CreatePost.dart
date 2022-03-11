import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:hackathon/Search.dart';
import 'Profile.dart';
import 'components/post_list.dart';

import 'common/utils.dart';
import 'components/textformfield.dart';
import 'models/Person.dart';
import 'services/UploadMedia.dart';
//import 'services/CreatePostService.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final UploadService _uploadService = UploadService();
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _commentController = TextEditingController();

  Future<Person>? _futurePerson;
  Uint8List? _bytesData;
  File? _selectedFile;
  FilePickerResult? pickerResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          trailing: GestureDetector(
            onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                )),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 28,
            ),
          ),
          title: Center(
            child: const Text(
              'Creation d\'une poste',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Center(
            child: _futurePerson == null ? buildFormLogin() : buildFutureBuilderLogin(),
          ),
    );
  }

  Form buildFormLogin() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: CustomTextFormField(
                controller: _titleController,
                input: "Titre",
                isPassword: false,
              ),
            ),
            SizedBox(height: 10), // to add separation between two widgets
            Container(
              child: CustomTextFormField(
                controller: _commentController,
                input: "Commentaire",
                isPassword: true,
                maxLines: 6
              ),
            ),
            SizedBox(height: 10), // to add separation between two widgets
            ElevatedButton(
              onPressed: () async => pickerResult = await FilePicker.platform.pickFiles(),
              child: Text('Upload'),
            ),
 
            ElevatedButton(
              onPressed: onClickSubmitButton,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<Person> buildFutureBuilderLogin() {
    return FutureBuilder<Person>(
      future: _futurePerson,
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if(snapshot.hasError){
              Utils.displayAlertDialog(context, "Error", "Error during the CreatePost");
              return buildFormLogin();
            }
            if(!snapshot.hasData){
              Utils.displayAlertDialog(context, "Error", "Person not found");
              return buildFormLogin();
            }
            Utils.displayAlertDialog(context, "Success", "CreatePost");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Search()),
            );
            return Text(snapshot.data!.name);
          default:
            return Text("CreatePost");
        }
      },
    );
  }

  void onClickSubmitButton() async {
    if (_formKey.currentState!.validate()) {
      try{
        File? file;
        if (pickerResult != null) {
           file = File(pickerResult!.files!.single!.path!);
        }
        await _uploadService.uploadFile(selectedFile: file, idUser: "1234", title: _titleController.text.trim(), text: _commentController.text.trim());
        Utils.displayAlertDialogWithPopUp(context, "Success", "Success creating the file");
      }catch(err){
        Utils.displayAlertDialog(context, "Error Message", err.toString());
      }
    }
  }

  
}
