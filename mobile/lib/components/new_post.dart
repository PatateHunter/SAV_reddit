import 'package:flutter/material.dart';
import 'package:hackathon/components/custom_text_field.dart';

class NewPost extends StatefulWidget {
  const NewPost({ Key? key }) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(),
      ],
    );
  }
}