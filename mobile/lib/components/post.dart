import 'package:flutter/material.dart';
import 'package:hackathon/components/comments/comment_list.dart';
import 'package:hackathon/components/post_content/content_type_enum.dart';
import 'package:hackathon/components/post_content/image_viewer.dart';
import 'package:hackathon/components/post_content/text_viewer.dart';
import 'package:hackathon/components/post_content/video_viewer.dart';
import 'package:hackathon/components/votes_counter.dart';

import '../person.dart';

class Post extends StatefulWidget {
  final Person person;
  final ContentType contentType;
  final String mediaPath;
  final String date;
  final String text;
  final String description;

  const Post(this.person, this.contentType, this.mediaPath, this.date, this.text, this.description);

  @override
  _PostState createState() => _PostState(this.person, this.contentType, this.mediaPath, this.date, this.text, this.description);
}

class _PostState extends State<Post> {
  final Person person;
  final ContentType contentType;
  final String mediaPath;
  final String date;
  final String text;
  final String description;
  int _votes = 0;

  _PostState(this.person, this.contentType, this.mediaPath, this.date, this.text, this.description);
  @override
  Widget build(BuildContext context) {
    return InkWell(
              child: Container(
                margin: EdgeInsets.only(top:20),
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
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(this.person.photoUrl),
                                        radius:30
                                        
                                  ),
                                ) /* CircleImage(
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
                                            //snapshot.data()['displayName'] ?? 'unknown display name',
                                            
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
                                          person.name,
                                          /* snapshot.data()['school'] ?? 'unknown school', */
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          this.description,
                                          //snapshot.data()['study'] ?? 'unknown study',
                                          style:
                                              TextStyle(color: Colors.black54),
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
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 16),
                            child: TextViewer(
                                this.text)),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            this.date,
                            //getChatTime(getModel.createdAt),
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        // Single or collection of images/videos
                        SizedBox(height: 8.0),
                        this.contentType == ContentType.TEXT ? Text("")
                         : Container(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            alignment: Alignment.centerRight,
                            child: this.contentType ==  ContentType.VIDEO ? VideoViewer(mediaPath) : ImageViewer(mediaPath),
                            /* getModel.imagePath == null
                                      ? SizedBox.shrink()
                                      : selectingGrid(imagePath: getModel.imagePath), */
                          ),
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
                                VotesCounter(_votes),
                                SizedBox(width: 12.0), // For padding
                                SizedBox(width: 12.0), // For padding
                                Expanded(child: SizedBox()),
                                //Icon(CustomIcons.bookmark_lineal),
                                SizedBox(width: 10.0), // For padding
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        // People liked information with icon
                        //NormalHomeFeedButton(model: getModel),
                        SizedBox(height: 4.0),
                        // View all comments
                        InkWell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 10),
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
                               Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommentList(),
                                        /* settings:
                                            RouteSettings(arguments: getModel.key), */
                                      ),
                                    ); 
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
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage("https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png"),
                                  ),
                            ) ,
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
            );

  }
}



