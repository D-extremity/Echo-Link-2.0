import 'package:chatapp/authorization/signupemail.dart';
import 'package:chatapp/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                                        onTap: () => SignUpMethods(_auth)
                                            .logOut(context),
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
            body: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Card(
                        child: Text(
                          "the_extremity\nmysatyam99@gmail.com",
                          style: TextStyle(color: Colors.black,fontSize: 20),
                        ),
                      ))
                ],
              ),
            )));
  }
}
