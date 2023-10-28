import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/homepage.dart';
import 'package:chatapp/pages/loginpage.dart';
import 'package:chatapp/utils/scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent)),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (content, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const HomePage();
              } else if (snapshot.hasError) {
                scaffoldSnackbar(context, "Error Occurred");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                scaffoldSnackbar(
                    context, "We are running for you ..please wait");
              }
            }
            return const LoginPage();
          }),
    );
  }
}
