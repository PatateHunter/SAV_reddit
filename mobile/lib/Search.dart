import 'package:flutter/material.dart';
import 'package:hackathon/components/post_list.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAV REDDIT'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(child: Image.asset('assets/images/logo.png')),
              SizedBox(height: 10), // to add separation between two widgets
              ListTile(
                trailing: GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PostList()),
                    );
                  }),          
                  child: Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: 28,
                  ),
                ),
                title: TextField(
                  onSubmitted: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PostList()),
                    );
                  },
                  //onChanged: (value) => setValueSearchBar(value),
                  decoration: InputDecoration(
                    hintText: 'Recherche par mots clés',
                    hintStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                    //border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('ou'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() => print("clicked")),
                child: Text("Poser une question?"),
              ),
              
              // SizedBox(height: 10), // to add separation between two widgets
              // ElevatedButton(
              //   onPressed: onClickSubmitButton,
              //   child: Text("Submit"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
