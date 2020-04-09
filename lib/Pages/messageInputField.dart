import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageInputField extends StatefulWidget {
  final ScrollController scrollController;
  MessageInputField(this.scrollController);

  @override
  MessageInputFieldState createState() {
    return MessageInputFieldState();
  }
}

class MessageInputFieldState extends State<MessageInputField> {
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
            IconButton(
              onPressed: () async {
                widget.scrollController.animateTo(
                  widget.scrollController.position.maxScrollExtent,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
                print(Timestamp.now());
                if (_formKey.currentState.validate()) {
                  Firestore.instance.collection('chats/main/messages').add({
                    'content': _messageController.text,
                    'dateCreated': Timestamp.now()
                  });
                }
              },
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
