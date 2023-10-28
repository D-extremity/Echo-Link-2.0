import 'package:chatapp/authorization/signupemail.dart';
import 'package:chatapp/pages/homepage.dart';
import 'package:chatapp/utils/scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginMethod {
  final String email;
  final String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginMethod({required this.email, required this.password});
  Future<void> loginEmail(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (_auth.currentUser!.emailVerified) {
        //& Email is not verified
        // ignore: use_build_context_synchronously
        await SignUpMethods(_auth).sendEmailVerification(context);
      } else if (!_auth.currentUser!.emailVerified) {
        //& Email is already verified
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      scaffoldSnackbar(context, e.message!);
    }
  }

  
}
