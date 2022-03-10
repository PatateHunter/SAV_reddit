import 'package:flutter/material.dart';
import '../../components/details_post/comment.dart';
import '../../components/details_post/question.dart';

import '../../test_data.dart';

class CommentList extends StatelessWidget {
  final post;
  
  CommentList(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All comments"),),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 5.0, right: 5.0, top: 20.0, bottom: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Question(this.post),
              Comment(TestData.personnes[0],"Mon premier commentaire", "09 Jun"),
              Comment(TestData.personnes[1],"Deuxieme !", "09 Jun"),
              Comment(TestData.personnes[2],"On top of the avatar, you can add any Widget in child property. The maximum width and height are the same as the avatar diameter. It supports any kind of Widget. One of the most common things to add is a Text.", "09 Jun"),
            ]
          ),
        ),
      ),
    );
  }
}