// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String recieverId;
  final String message;
  final String senderEmail;
  final Timestamp timeStamp;

  Message({
    required this.senderId,
    required this.recieverId,
    required this.message,
    required this.senderEmail,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'recieverId': recieverId,
      'message': message,
      'senderEmail': senderEmail,
      'timeStamp': timeStamp,
    };
  }


}
