import 'package:chatapp/pages/anonymouslogin.dart';
import 'package:chatapp/pages/emaillogin.dart';
import 'package:chatapp/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Lottie.asset("assets/signupscreenwelcome.json"),
          //!
          GestureDetector(
            onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const EmailLoginPage())),
            child: Card(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/mail.png",
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Email",
                    softWrap: true,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          //!
          GestureDetector(onTap: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const AnonymousLogin())),
            child: Card(
              margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/people.png",
                    color: Colors.lightBlue.shade900,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Anonymously",
                    softWrap: true,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
