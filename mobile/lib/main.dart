import 'package:flutter/material.dart';
import 'components/post_list.dart';

import 'Authentication.dart';
import 'components/AppSearchBar.dart';
import 'models/Question.dart';
import 'services/QuestionService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAV Reddit',
      theme: ThemeData(
        //backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SAV Reddit Home Page'),
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
  final QuestionService _questionService = QuestionService();
  List<Question> questions = [];
  String valueSearchBar = "";
  setValueSearchBar(String value) {
    setState(() {
      valueSearchBar = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return PostList();
    print(valueSearchBar);
    print(questions);
    /* return FutureBuilder(
      future: authStateFalse.getUserdata(userId: getModel?.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) { */
    return Scaffold(
      appBar: AppSearchBar(setValueSearchBar: setValueSearchBar,),
      body: Authentication()
    );
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

  void getQuestions() async {
    // try{
    questions = await _questionService.getQuestions();
    //List<TableRow> tableRows = [];
  }
}
