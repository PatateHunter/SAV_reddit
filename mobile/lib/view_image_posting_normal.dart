import 'package:flutter/material.dart';
import 'package:travelapp/Library/Widget/customWidgets.dart';

class ViewImagesPostingNormal extends StatefulWidget {
  final List numberofimage;
  ViewImagesPostingNormal(this.numberofimage, {Key key}) : super(key: key);

  @override
  _ViewImagesPostingNormalState createState() =>
      _ViewImagesPostingNormalState();
}

class _ViewImagesPostingNormalState extends State<ViewImagesPostingNormal> {
  Widget viewImages(imagePath) {
    return Padding(
      padding: EdgeInsets.all(
        2.0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
        child: customNetworkImage(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: PageView(
        controller: PageController(
          initialPage: 0,
        ),
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: List.generate(
          widget.numberofimage.length,
          (index) => viewImages(widget.numberofimage[index]),
        ),
      ),
    );
  }
}