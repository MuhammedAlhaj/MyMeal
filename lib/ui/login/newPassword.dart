import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymeal/ui/Widgets.dart';

class examp extends StatelessWidget {
  const examp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 46.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 48.0,left: 48.0),
              child: Center(
                child: Text(
                  'New Password',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64.0,right: 64.0),
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
            SizedBox(height:20),
            BorderText('New Password', TextInputType.visiblePassword,true),
            SizedBox(height:8),
            BorderText('Confirm Password', TextInputType.visiblePassword,true),
            SizedBox(height:30),
            Buttonss(text: 'Next', hight:350, width: 54, color:Colors.deepOrange),

          ]
          ),
        ),
      ),
    );
  }
}
