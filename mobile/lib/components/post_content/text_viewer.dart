import 'package:flutter/material.dart';

class TextViewer extends StatelessWidget {
  final text;
  const TextViewer(this.text);

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.all(
        2.0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text:this.text,
                                style: TextStyle(color: Colors.black),
                                /* children: _processCaption(
                                  getModel.description,
                                  '#',
                                  TextStyle(color: Colors.blue),
                                ), */
                              ),
                            ),
      ),
    );
  }
}