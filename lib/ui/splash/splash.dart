import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'AfterSplash.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(


        child: new SplashScreen(
          seconds: 10,
          navigateAfterSeconds: new AfterSplash(),
          title: new Text(
            'MyMEAL',
            style: TextStyle(
                color:Color(0xffffd800),
                fontWeight: FontWeight.bold,
                fontSize: 36),
          ),
        image: Image.asset('assets/images/splash.png',),
        photoSize: 200,
        ),
      )
    );
  }
}
