import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:mymeal/ui/Widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 46.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Login',
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
                  'Add your details to login',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                ),
              ),
              BorderText('your Email',TextInputType.emailAddress,false),
              BorderText('Password',TextInputType.text,true),
              SizedBox(
                height: 40,
              ),
              Buttonss(
                  text: 'Login',
                  hight: 350,
                  width: 50,
                  color: Colors.deepOrange),
              SizedBox(
                height: 16,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(fontSize: 16),

                  )),
              SizedBox(
                height: 64,
              ),
              Text('or Login With',style: TextStyle(color: Colors.grey[800],fontSize: 16),),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 36, right: 36, top: 16),
                child: SignInButton(
                  Buttons.Facebook,
                  onPressed: () {},
                  text: 'Login with Facebook',
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 36, right: 36, top: 16),
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                  text: 'Login with Google',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account?",style: TextStyle(fontWeight: FontWeight.bold),),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                            'Sign Up',
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
