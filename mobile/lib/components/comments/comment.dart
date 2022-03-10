import 'package:flutter/material.dart';


class Comment extends StatelessWidget {
  final text;
  var date;
  var commiter;
  var state;

  Comment(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Mon commentaire"),
    );
  }
}