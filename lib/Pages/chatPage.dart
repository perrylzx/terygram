import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:terygram/Pages/messageInputField.dart';

// This is the main chat page which renders both the chat history and the input text field for sending messages
class ChatPage extends StatefulWidget {
  // TODO(Perry): Make chat bubbles alternate between green and white to differentiate between users
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController _scrollController = new ScrollController();

// This is a widget that takes in a document snapshot from firestore query and displays it in a chat bubble
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Bubble(
              padding: BubbleEdges.all(20),
              color: Color.fromRGBO(225, 255, 199, 1.0),
              child: Text(
                document['content'].toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          // for each new document created in the messages collection, display it in the chat Page
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection('chats/main/messages')
                  .orderBy('dateCreated', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                return ListView.builder(
                  // TODO(Perry): Make this chatpage render starting from the bottom
                  controller: _scrollController,
                  itemExtent: 80.0,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                      _buildListItem(context, snapshot.data.documents[index]),
                );
              }),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: MessageInputField(_scrollController),
        )
      ]),
    );
  }
}
