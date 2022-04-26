import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymeal/ui/Widgets.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 46.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Text(
                'Reset Password',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0,right: 48.0),
              child: Center(
                child: Text(
                  'Please enter your email to receive alink to  create a new password via email',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            BorderText('Email', TextInputType.emailAddress, false),
            SizedBox(
              height: 24,
            ),
            Buttonss(text: 'Send', hight: 350, width: 50, color: Colors.deepOrange),
          ]),
        ),
      ),
    );
  }
}
