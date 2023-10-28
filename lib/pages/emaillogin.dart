// import 'dart:ui';

import 'package:chatapp/authorization/signupemail.dart';
import 'package:chatapp/utils/color.dart';
import 'package:chatapp/utils/scaffold.dart';
import 'package:chatapp/widget/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  //!SignUp with Email
  void signUpEmail(BuildContext context) async {
    await SignUpMethods(FirebaseAuth.instance).signUpWithEmail(
        email: getEmail.text,
        password: getPass.text,
        context: context,
        userName: getUserName.text);
  }

  TextEditingController getUserName = TextEditingController();
  TextEditingController getEmail = TextEditingController();
  TextEditingController getPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        fit: StackFit.loose,
        children: [
          Opacity(
              opacity: 0.1,
              child: Center(
                  child: Lottie.asset("assets/signupscreenwelcome.json",
                      fit: BoxFit.fill))),
          // BackdropFilter(filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),child: Lottie.asset("assets/"),),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Let's\nConnect",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 40,
                ),
                InputText(
                  false,
                  hintText: "Enter Username",
                  labelText: "Username",
                  context: context,
                  controller: getUserName,
                ).inputTextField(),
                const SizedBox(
                  height: 40,
                ),
                InputText(
                  false,
                  hintText: "Enter Email",
                  labelText: "Email",
                  context: context,
                  controller: getEmail,
                ).inputTextField(),
                const SizedBox(
                  height: 40,
                ),
                InputText(
                  true,
                  hintText: "Enter Password",
                  labelText: "Password",
                  context: context,
                  controller: getPass,
                ).inputTextField(),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (getEmail.text.isNotEmpty &&
                          getPass.text.isNotEmpty &&
                          getUserName.text.isNotEmpty) {
                        signUpEmail(context);
                      } else {
                        scaffoldSnackbar(context, "Field are empty");
                      }
                    },
                    child: const Text("Sign Up")),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
