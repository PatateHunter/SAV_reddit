import 'package:flutter/material.dart';

class VotesCounter extends StatefulWidget {
  final counter;

  VotesCounter(this.counter);
  @override
  _VotesCounterState createState() => _VotesCounterState(this.counter);
}

class _VotesCounterState extends State<VotesCounter> {
  int _counter;

  _VotesCounterState(this._counter);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /* getState.addLikeToTweet(
         getModel, authStateFalse?.userId); */
      },
      child:
          /* Icon(
            likeList
                ? CustomIcons.like_fill
                : CustomIcons.like_lineal,
            color: likeList ? Colors.red : Colors.black,
          ), */ //Text("icon like"),
          Column(
        children: [
          GestureDetector(
            onTap: _incrementCounter,
            child: Icon(
              Icons.arrow_drop_up_outlined,
              size: 35,
            ),
          ),
          Text(
            this._counter.toString(),
            style: TextStyle(fontSize: 18, color: _counter > 0 ? Colors.green : Colors.black),
          ),
          GestureDetector(
            onTap: _decrementCounter,
            child: Icon(
              Icons.arrow_drop_down_outlined,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
}
