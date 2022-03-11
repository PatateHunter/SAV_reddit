import 'package:flutter/material.dart';

import '../../components/post_content/content_type_enum.dart';

import '../../test_data.dart';

import '../post.dart';

class TopComment extends StatelessWidget {
  late Post post;

  TopComment(this.post);

  @override
  Widget build(BuildContext context) {
    return this.post.topComment != null
        ? Container(
            decoration: BoxDecoration(color: Colors.white,

//borderRadius: BorderRadius.all(Radius.circular(10.0)),

                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF656565).withOpacity(0.25),
                    spreadRadius: 1.0,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                this.post.topComment!.text,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
              ),
            ),
          )
        : SizedBox(height: 0.0);
  }
}
