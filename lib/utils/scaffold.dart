// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void scaffoldSnackbar(BuildContext context, String e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e)));
  }
