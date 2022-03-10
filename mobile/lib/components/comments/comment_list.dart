import 'package:flutter/material.dart';
import 'package:hackathon/components/comments/comments_test_data.dart';

class CommentList extends StatelessWidget {
  
  CommentList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 5.0, right: 5.0, top: 20.0, bottom: 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: CommentsTestData.list,
          ),
        ),
      ),
    );
  }
}