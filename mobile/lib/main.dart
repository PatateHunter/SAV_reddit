import 'package:flutter/material.dart';
import 'package:hackathon/components/post_content/image_viewer.dart';
import 'package:hackathon/components/post_list.dart';
import 'package:hackathon/components/post_content/text_viewer.dart';
import 'package:hackathon/view_image_posting_normal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    /* return FutureBuilder(
      future: authStateFalse.getUserdata(userId: getModel?.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) { */
          return PostList();
        /* } else if ((snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.active)) {
          return SizedBox(
              // itutuloy function if loading
              );
        } else {
          return SizedBox();
        }
      },
    ); */
  }
}
