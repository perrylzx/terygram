import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  Widget chatBubble = Bubble(
    child: Text('data'),
  );
  Widget messages = RaisedButton(
      onPressed: () {},
      child: Text(
        'Send Message',
        style: TextStyle(fontSize: 30),
      ));
  // final List<Widget> messageHistory = [
  //   messages,
  // ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Page',
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            messages,
            chatBubble,
          ], // as more messages come in add more chat bubbles here
        ),
      ),
    );
  }
}
