import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  @override
  InputFieldState createState() {
    return InputFieldState();
  }
}

class InputFieldState extends State<InputField> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border(top: BorderSide(width: 1, color: Colors.green)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: myBoxDecoration(),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _messageController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    Firestore.instance
                        .collection('chats/main/messages')
                        .add({'content': _messageController.text});
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection('chats/main/messages')
                  // .orderBy('_timeStampUTC', descending: true) //TODO(Perry): Order by time descending
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
          child: InputField(),
        )
      ]),
    );
  }
}
