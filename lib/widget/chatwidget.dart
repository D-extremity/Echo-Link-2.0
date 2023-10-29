import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
 final bool isMyChat;
  final String chat;

  const ChatWidget({
    super.key,
    required this.size,
    required this.chat,
    required this.isMyChat,
  });

  final Size size;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.45,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
            colors: widget.isMyChat
                ? [
                    const Color.fromARGB(255, 173, 58, 183).withOpacity(0.2),
                    const Color.fromARGB(255, 221, 61, 215).withOpacity(0.2),
                    const Color.fromARGB(255, 208, 5, 244).withOpacity(0.1),
                    const Color.fromARGB(255, 210, 13, 228).withOpacity(0.1),
                    Colors.pink.withOpacity(0.2),
                  ]
                : [
                    const Color.fromARGB(255, 147, 227, 129).withOpacity(0.2),
                    const Color.fromARGB(255, 71, 205, 87).withOpacity(0.2),
                    const Color.fromARGB(255, 66, 199, 117).withOpacity(0.1),
                    const Color.fromARGB(255, 21, 235, 85).withOpacity(0.2),
                    const Color.fromARGB(255, 57, 194, 86).withOpacity(0.1),
                  ]),
      ),
      child: Text(
        widget.chat,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
