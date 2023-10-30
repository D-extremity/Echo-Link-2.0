import 'package:chatapp/models/chatmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //! Send Message
  Future<void> sendMessage(
      {required String recieverId, required String message}) async {
    //& Get Current User Info
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email.toString();
    final Timestamp timeStamp = Timestamp.now();
    //& Create New Message

    Message newMessage = Message(
        senderId: currentUserId,
        recieverId: recieverId,
        message: message,
        senderEmail: currentUserEmail,
        timeStamp: timeStamp);
    //& Construct chat room id from senderId and recieverId (sort senderId and recieverId then create chatRoomId to avoid two different chatrooms for a single conversation room )
    List<String> ids = [currentUserId, recieverId];
    ids.sort();
    final String chatRoomId = ids.join('_');
    //& add new message to database
    await _firestore
        .collection('Chat Rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //& get Messages
  Stream<QuerySnapshot> getMessages(
      {required String userId, required String otherUserId}) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    final String chatRoomId = ids.join('_');
    return _firestore
        .collection('Chat Rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots();
  }
}
