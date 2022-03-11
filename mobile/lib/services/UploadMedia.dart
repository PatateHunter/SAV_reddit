import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../person.dart';

class UploadService{
  final _baseUrl= "http://0.0.0.0:3000/";

  Future<void> uploadFile({File? selectedFile, required String idUser, required String title, required String text}) async {
    try{
      var dio = new Dio();
      dio.options.baseUrl = _baseUrl;
      dio.options.connectTimeout = 5000; //5s
      dio.options.receiveTimeout = 5000;
      // dio.options.headers = <Header Json>;

      if (selectedFile != null &&
          selectedFile.path != null &&
          selectedFile.path.isNotEmpty) {
        // Create a FormData
        String fileName = selectedFile.path;
      }

      var formData = FormData.fromMap({
        'title': title,
        'userId': idUser,
        'dateHourAdd': DateTime.now(),
        'content': text,
        'ranking': 0,
        'file': selectedFile != null ? await MultipartFile.fromFile(selectedFile.path, filename: selectedFile.path.split('/').last) : null
      });
      print(formData);
      // var response = await dio.post(_baseUrl + "uploadImageSection", data: formData);
      
      // var formData = FormData.fromMap({
      //   'title': title,
      //   'userId': idUser,
      //   'dateHourAdd': DateTime.now(),
      //   'content': text,
      //   'ranking': 0,
      //   'file': http.MultipartFile.fromBytes('file', selectedFile,
      //     //contentType: new MediaType('multipart', 'form-data'), 
      //     filename: "filename",),
      // });
      // print(formData);
      // var response = await dio.post(_baseUrl + "uploadImageSection", data: formData);
      // if (response.statusCode != 200) {
      //   throw Exception("failed to upload");
      // }
    }
    catch(err){
      throw Exception(err);
    }
  }
}