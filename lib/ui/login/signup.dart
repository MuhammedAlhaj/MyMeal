import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymeal/ui/Widgets.dart';

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(top: 46.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Add your details to sign up',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                ),
              ),
              BorderText('Name',TextInputType.text,false),
              BorderText('Email',TextInputType.emailAddress,false),
              BorderText('Mobile Number',TextInputType.phone,false),
              BorderText('Address',TextInputType.text,false),
              BorderText('Password',TextInputType.text,true),
              BorderText('Confirm Password',TextInputType.text,false),
              SizedBox(
                height: 40,
              ),
              Buttonss(
                  text: 'Sign Up',
                  hight: 350,
                  width: 50,
                  color: Colors.deepOrange),
              Padding(
                padding: const EdgeInsets.only(top:72),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?",style: TextStyle(fontWeight: FontWeight.bold),),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.deepOrange)

                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
