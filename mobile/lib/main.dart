import 'package:flutter/material.dart';

import 'AppSearchBar.dart';
import 'models/Question.dart';
import 'services/http_service.dart';

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
  final HttpService _httpService = HttpService();
  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    print(questions);
    /* return FutureBuilder(
      future: authStateFalse.getUserdata(userId: getModel?.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) { */
    return Scaffold(
      appBar: AppSearchBar(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF656565).withOpacity(0.15),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  )
                ]),
            child: Wrap(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // User profile, name and more option
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            /* Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => Profile(
                                            profileId: snapshot.data()['userId'],
                                          ),
                                      transitionDuration:
                                          Duration(milliseconds: 2000),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      })); */
                          },
                          child: Icon(Icons
                              .access_alarm_rounded), /* CircleImage(
                                  snapshot.data()['profilePic'] ?? 'unknown picture',
                                  imageSize: 36.0,
                                  whiteMargin: 2.0,
                                  imageMargin: 6.0,
                                ), */
                          //Text("circle Image")
                        ),
                        InkWell(
                          onTap: () {
                            /* Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => Profile(
                                            profileId: snapshot.data()['userId'] ?? 'unknown userId',
                                          ),
                                      transitionDuration:
                                          Duration(milliseconds: 2000),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      })); */
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("text"
                                        //snapshot.data()['displayName'] ?? 'unknown display name',
                                        ),
                                  ],
                                ),
                                // Row(
                                //   children: <Widget>[
                                //     Text(
                                //       snapshot.data['username'],
                                //       style:
                                //           TextStyle(color: Colors.black54),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Nom",
                                      /* snapshot.data()['school'] ?? 'unknown school', */
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Description post",
                                      //snapshot.data()['study'] ?? 'unknown study',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () =>
                                null /* _showMuteDialog(
                                  getContext,
                                  getModel,
                                  isMyPost,
                                  displayname: snapshot.data()['displayName'] ?? 'unknown displayName',
                                  username: snapshot.data()['username'] ?? 'unknown username',
                                  userId: snapshot.data()['userId'] ?? 'unknown userId',
                                ), */
                            ),
                      ],
                    ),
                    //Caption
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 16),
                      child: /* RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: _processCaption(
                                  getModel.description,
                                  '#',
                                  TextStyle(color: Colors.blue),
                                ),
                              ),
                            ), */
                          Text("Contenu post"),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Date",
                        //getChatTime(getModel.createdAt),
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    // Single or collection of images/videos
                    SizedBox(height: 8.0),
                    Container(
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          alignment: Alignment.centerRight,
                          child: /* getModel.imagePath == null
                                  ? SizedBox.shrink()
                                  : selectingGrid(imagePath: getModel.imagePath), */
                              Text("animted Container")),
                    ),
                    SizedBox(height: 8.0),
                    // Different icon buttons and image slider indicator
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        // Actions buttons/icons
                        Row(
                          children: <Widget>[
                            SizedBox(width: 12.0), // For padding
                            InkWell(
                              onTap: () {
                                null;
                                /* getState.addLikeToTweet(
                                          getModel, authStateFalse?.userId); */
                              },
                              child: /* Icon(
                                      likeList
                                          ? CustomIcons.like_fill
                                          : CustomIcons.like_lineal,
                                      color: likeList ? Colors.red : Colors.black,
                                    ), */
                                  Text("icon like"),
                            ),
                            SizedBox(width: 12.0), // For padding

                            InkWell(
                                child: /* Icon(
                                        //CustomIcons.comment,
                                      ), */
                                    Text("Icon"),
                                onTap: () {
                                  /* Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Comment(),
                                            settings: RouteSettings(
                                                arguments: getModel.key),
                                          ),
                                        ); */
                                }),

                            SizedBox(width: 12.0), // For padding
                            Expanded(child: SizedBox()),
                            Text("icon"),
                            //Icon(CustomIcons.bookmark_lineal),
                            SizedBox(width: 10.0), // For padding
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    // People liked information with icon
                    //NormalHomeFeedButton(model: getModel),
                    Text("Normal home feed button"),

                    SizedBox(height: 4.0),
                    // View all comments
                    InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 10),
                          child: Row(children: [
                            Text(
                              'View all',
                              style: TextStyle(color: Colors.black45),
                            ),
                            Text(
                              ' comments',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ]),
                        ),
                        onTap: () {
                          /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Comment(),
                                    settings:
                                        RouteSettings(arguments: getModel.key),
                                  ),
                                ); */
                        }),
                    SizedBox(height: 4.0),
                    // Add comment section
                    Row(
                      children: <Widget>[
                        /* CircleImage(
                                authStateFalse.userModel.profilePic,
                                imageSize: 30.0,
                                whiteMargin: 2.0,
                                imageMargin: 6.0,
                              ), */
                        Icon(Icons.add_circle),
                        //Text("Circle image"),
                        Expanded(
                          child: TextField(
                              //controller: commentController,
                              decoration: InputDecoration(
                                hintText: 'Add a comment...',
                                border: InputBorder.none,
                              ),
                              onSubmitted: (str) {
                                /* commentState.addComentToPost(
                                          getModel.key.toString(),
                                          str,
                                          DateTime.now().toString(),
                                          authStateFalse?.userId,
                                          authStateFalse.userModel.displayName,
                                          authStateFalse.userModel.profilePic);

                                      final snackBar = SnackBar(
                                        content: Text('Comment Posted'),
                                        action: SnackBarAction(
                                          textColor: Color(0xff2acfff),
                                          label: 'See Comment',
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Comment(),
                                                settings: RouteSettings(
                                                    arguments: getModel.key),
                                              ),
                                            );
                                          },
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);

                                      commentController.clear(); */
                              }),
                        ),
                        SizedBox(width: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 15.0,
                            color: Colors.black26,
                          ),
                        ),
                        SizedBox(width: 12.0),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
    questions = await _httpService.getQuestions();
    //List<TableRow> tableRows = [];
  }
}
