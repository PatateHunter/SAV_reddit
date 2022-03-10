import 'package:flutter/material.dart';
import 'package:hackathon/components/post.dart';
import 'package:hackathon/components/post_content/image_viewer.dart';
import 'package:hackathon/components/post_content/text_viewer.dart';

class PostList extends StatefulWidget {
  const PostList();

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 5.0, right: 5.0, top: 20.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Post(),
              Post()
            ],
          ),
        ),
      ),
    );
  }
}
