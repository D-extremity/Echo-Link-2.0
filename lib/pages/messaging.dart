import 'package:chatapp/utils/color.dart';
import 'package:chatapp/widget/chatwidget.dart';
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
        child: ListView(children: [
          Container(
            height: size.height * 0.8,
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChatWidget(size: size,isMyChat: false,chat: "Satyam is my name heres the first chat",),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onTapOutside: (event) =>
                    FocusScope.of(context).requestFocus(FocusNode()),
                style: const TextStyle(fontSize: 20),
                canRequestFocus: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 40,
                      color: Colors.blueGrey.shade900,
                    ),
                    onPressed: () {}, //! send chat
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
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    ));
  }
}

