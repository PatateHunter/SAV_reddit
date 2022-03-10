import 'package:flutter/material.dart';

//AppBar must PreferredSizeWidget
class AppSearchBar extends StatefulWidget implements PreferredSizeWidget {
  //final User user;
  const AppSearchBar({ Key? key, /*required this.user*/ }) : super(key: key);

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50); // size in height of AppBar
}

class _AppSearchBarState extends State<AppSearchBar> {
  Icon customIcon = const Icon(Icons.search);
  Widget customAppBarTitle = const Text('SAV REDDIT');
  Widget customAppBarSearch = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Put your key-word',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: customIcon.icon == Icons.search ? customAppBarTitle : customAppBarSearch,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                }else{
                  customIcon = const Icon(Icons.search);
                }
              });
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      );
  }
}