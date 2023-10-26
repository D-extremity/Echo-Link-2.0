import 'package:chatapp/pages/signuppage.dart';
import 'package:chatapp/utils/color.dart';
import 'package:chatapp/widget/textinput.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Center(
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 300),
                  duration: const Duration(milliseconds: 1000),
                  builder: (BuildContext context, size, noUseCurrently) =>
                      Image.asset("assets/people.png", height: size)),
            ),
            InputText(false,
                    hintText: "Email / Username",
                    labelText: "Email / User Name",
                    context: context)
                .inputTextField(),
            SizedBox(
              height: size.height * 0.05,
            ),
            InputText(true,
                    hintText: "Enter Your Password",
                    labelText: "Password",
                    context: context)
                .inputTextField(),
            SizedBox(
              height: size.height * 0.05,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                },
                child: const Text("Login")),
            Opacity(
                opacity: isLoading ? 1 : 0,
                child: Lottie.asset("assets/loading.json",
                    height: 50, filterQuality: FilterQuality.high)),
            Center(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have An Account?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPage())),
                    child: const Text(
                      " SignUp",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
