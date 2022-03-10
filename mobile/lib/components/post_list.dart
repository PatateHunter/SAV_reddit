
import 'package:flutter/material.dart';
import 'package:hackathon/components/post.dart';
import 'package:hackathon/components/post_content/content_type_enum.dart';
import 'package:hackathon/components/post_content/image_viewer.dart';
import 'package:hackathon/components/post_content/text_viewer.dart';
import 'package:hackathon/test_data.dart';

import '../person.dart';

class PostList extends StatefulWidget {
  const PostList();

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAV REDDIT'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 5.0, right: 5.0, top: 20.0, bottom: 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Post(TestData.personnes[0],ContentType.VIDEO, 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', "1 Jun", "Coucou je m'appelle Alexandre Paprocki, je suis en 4AL à l'ESGI", "Voici ma description"),
              Post(TestData.personnes[1],ContentType.TEXT, '', "09 Jun", "There are two other properties related to size: minRadius and maxRadius. They are used to set the minimum and maximum radius respectively. I", "Description"),
              Post(TestData.personnes[2],ContentType.IMAGE, 'https://static.fnac-static.com/multimedia/Images/FD/Comete/114332/CCP_IMG_ORIGINAL/1481839.jpg', "10 Jun",'Hello! For my AP subject what is the fastest growing economy?', "La description")
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
              onPressed: newPost,
              tooltip: 'Write a new post',
              child: Icon(Icons
                  .add)),
      ) // This trailing comma makes auto-formatting nicer for build methods.
        
    );
  }

  void newPost() {
    print("new post");
  }
}
