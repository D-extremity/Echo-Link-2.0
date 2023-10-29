// import 'dart:js_interop';

import 'package:chatapp/utils/scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpMethods {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  SignUpMethods(this._auth);

  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required String userName,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      await sendEmailVerification(context);
      

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': userName,
        'uid': userCredential.user!.uid,
        // 'uid': userName,
        'email': email,
        'password': password,
      });
      Navigator.of(context).pop();
      // ignore: use_build_context_synchronously
      scaffoldSnackbar(context, "Account Created Successfully");
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      scaffoldSnackbar(context, e.message!);
    }
  }

  //! Send Email Verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      scaffoldSnackbar(context, "Email Verification Sent");
    } on FirebaseAuthException catch (e) {
      scaffoldSnackbar(context, e.message!);
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await _auth.signOut();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      scaffoldSnackbar(context, e.message!);
    }
  }
}
