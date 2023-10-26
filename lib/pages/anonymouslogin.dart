import 'package:chatapp/utils/color.dart';
import 'package:chatapp/widget/textinput.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnonymousLogin extends StatefulWidget {
  const AnonymousLogin({super.key});

  @override
  State<AnonymousLogin> createState() => _AnonymousLoginState();
}

class _AnonymousLoginState extends State<AnonymousLogin> {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Let's\nConnect",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "Anonymous SignUp will have all features ,\nyou can signin also later but username will have Username+.guest as username automatically.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.red),
                  ),
                  const Spacer(flex: 1),
                  InputText(
                    false,
                    hintText: "Enter Username",
                    labelText: "Username",
                    context: context,
                  ).inputTextField(),
                  const SizedBox(
                    height: 40,
                  ),
                  InputText(true,
                          hintText: "Enter Password",
                          labelText: "Password",
                          context: context)
                      .inputTextField(),
                      const SizedBox(height: 40,),
                  ElevatedButton(onPressed: () {}, child: const Text("Sign Up")),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

 