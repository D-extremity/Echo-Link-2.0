import 'package:chatapp/authorization/signupemail.dart';
import 'package:chatapp/pages/messaging.dart';
import 'package:chatapp/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text(
                              "Do you really want to Log out",
                              style: TextStyle(color: Colors.red),
                            ),
                            actions: [
                              GestureDetector(
                                  onTap: () =>
                                      SignUpMethods(_auth).logOut(context),
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: const Text(
                                  "No",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ));
                },
                child: const Icon(
                  Icons.output_rounded,
                  color: Colors.red,
                  size: 30,
                )),
          )
        ],
        title: Text(
          "Chats",
          style: TextStyle(color: Colors.cyan.shade100, fontSize: 25),
        ),
        backgroundColor: darkBackgroundColor,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SizedBox(height: 120,width: 120,child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              // print("**************");
              // print(snapshot.data!.docs[0].data());
              // print(snapshot.data!.docs);
              // print(snapshot.data);

              // print("**************");

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    // var userId = snapshot.data?.docs[index].id;
                    Map<String,dynamic> userData = snapshot.data?.docs[index].data() as Map<String,dynamic>;
                  
                    return ListTile(
                      leading: CircleAvatar(
                        // You can use user image or initials here
                        // Example: backgroundImage: NetworkImage(userData['profileImage']),
                        child: Text(userData['username']
                            [0]), // Displaying the first letter of the username
                      ),
                      title: Text(userData['username']),
                      subtitle: Text(userData['email']),
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => Messaging(
                                otherPersonName: userData['username'],
                                otherPersonId: userData['uid'])));
                      },
                    );
                  });
            }
            return const CircularProgressIndicator();
          }),
    ));
  }
}
