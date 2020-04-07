import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  // despite this widget not using state, debug returns an error when it is not a stateful widget. TODO(Perry): Figure out why
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Bubble(
            child: Text(
              document['content'].toString(),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatBubble = Bubble(
    child: Text('data'),
  );

  Widget messages = RaisedButton(
      onPressed: () {},
      child: Text(
        'Send Message',
        style: TextStyle(fontSize: 30),
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Page',
      home: Scaffold(
        appBar: AppBar(title: Text('Chat')),
        body: Container(
          child: Column(children: [
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('chats/main/messages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return ListView.builder(
                      itemExtent: 80.0,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => _buildListItem(
                          context,
                          snapshot.data.documents[
                              index]), // as more messages come in add more chat bubbles here
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('Hello'),
            )
          ]),
        ),
      ),
    );
  }
}
