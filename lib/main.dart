import 'package:flutter/material.dart';
import 'package:mymeal/examp.dart';
import 'package:mymeal/ui/login/CheckCode.dart';
import 'package:mymeal/ui/login/ResetPassword.dart';
import 'package:mymeal/ui/login/login.dart';
import 'package:mymeal/ui/login/signin.dart';
import 'package:mymeal/ui/login/signup.dart';
import 'package:mymeal/ui/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: examp(),
    );
  }
}


