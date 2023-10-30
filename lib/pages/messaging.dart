// import 'dart:isolate';

import 'package:chatapp/authorization/chatservice.dart';
import 'package:chatapp/utils/color.dart';
import 'package:chatapp/widget/chatwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messaging extends StatefulWidget {
  final String otherPersonName;
  final String otherPersonId;

  const Messaging(
      {super.key, required this.otherPersonName, required this.otherPersonId});

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  void sendMessage() async {
    if (_messageController.text.trim().isNotEmpty) {
      await _chatService.sendMessage(
          recieverId: widget.otherPersonId, message: _messageController.text);
      //! cleaning the controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.otherPersonName,
          style: TextStyle(color: Colors.cyan.shade100, fontSize: 25),
        ),
        backgroundColor: darkBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: ListView(
          children: [
            Container(
              height: size.height * 0.75,
              width: double.infinity,
              // ! child: ,  Column will come here to show chats
              // color: Colors.deepPurple.shade200.withOpacity(0.2),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.deepPurple.withOpacity(0.2),
                    Colors.deepPurpleAccent.withOpacity(0.2),
                    const Color.fromARGB(255, 208, 5, 244).withOpacity(0.1),
                    const Color.fromARGB(255, 210, 13, 228).withOpacity(0.1),
                    Colors.pink.withOpacity(0.2),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildMessageList(size))
                  // ChatWidget(
                  // size: size,
                  //   isMyChat: false,
                  //   chat: "  Satyam is my name heres the first chat",
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onTapOutside: (event) =>
                    FocusScope.of(context).requestFocus(FocusNode()),
                style: const TextStyle(fontSize: 20),
                controller: _messageController,
                canRequestFocus: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 40,
                      color: Colors.blueGrey.shade900,
                    ),
                    onPressed: () {
                      sendMessage();
                    }, //! send chat
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: Colors.deepPurple,
                  filled: true,
                  hintText: "Yeah , why not..",
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildMessageList(final size) {
    return StreamBuilder(
        stream: _chatService.getMessages(
            userId: FirebaseAuth.instance.currentUser!.uid,
            otherUserId: widget.otherPersonId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error : ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(height: 10,width: 10,child: CircularProgressIndicator());
          }

          return ListView(
            reverse: true,
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document, size))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot document, final size) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment =
        (data['senderId'] == FirebaseAuth.instance.currentUser!.uid.toString()
            ? Alignment.centerRight
            : Alignment.centerLeft);
    bool isMyChat =
        (data['senderId'] == FirebaseAuth.instance.currentUser!.uid.toString());
    return ChatWidget(
      size: size,
      chat: data['message'],
      isMyChat: isMyChat,
      alignment: alignment,
      otherPersonName: widget.otherPersonName,
      senderName: "You",
    );
  }
}
