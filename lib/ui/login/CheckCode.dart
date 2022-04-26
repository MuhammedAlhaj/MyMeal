import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets.dart';

class CheckCode extends StatelessWidget {
  const CheckCode({Key? key}) : super(key: key);

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
                  'We have sent an OTP to your Mobile',
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
              padding: const EdgeInsets.only(left: 32.0,right: 32.0),
              child: Center(
                child: Text(
                  'Please check your mobile number 099*****12 continue to reset your password',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 72,
                  width: 75,
                  child:Card(
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(20),
                    ),
                    color:Colors.grey[300],
                    child: Container(

                      child: TextFormField(
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),
                        textAlign: TextAlign.center,
                        keyboardType:TextInputType.number,
                        decoration:InputDecoration(
                          hintText:'*',
                          hintStyle:TextStyle(fontSize:32,fontWeight: FontWeight.bold,color:Colors.grey[500] ),
                          border:InputBorder.none,
                          fillColor:Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 72,
                  width: 75,
                  child:Card(
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(20),
                    ),
                    color:Colors.grey[300],
                    child: Container(
                      padding:EdgeInsets.only(left:24),
                      child: TextFormField(
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),
                        keyboardType:TextInputType.number,
                        decoration:InputDecoration(
                          hintText:'*',
                          hintStyle:TextStyle(fontSize:32,fontWeight: FontWeight.bold,color:Colors.grey[500], ),
                          border:InputBorder.none,
                          fillColor:Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 72,
                  width: 75,
                  child:Card(
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(20),
                    ),
                    color:Colors.grey[300],
                    child: Container(
                      padding:EdgeInsets.only(left:24),
                      child: TextFormField(
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),
                        keyboardType:TextInputType.number,
                        decoration:InputDecoration(
                          hintText:'*',
                          hintStyle:TextStyle(fontSize:32,fontWeight: FontWeight.bold,color:Colors.grey[500], ),
                          border:InputBorder.none,
                          fillColor:Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 72,
                  width: 75,

                  child:Card(
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(20),
                    ),
                    color:Colors.grey[300],
                    child: Container(
                      padding:EdgeInsets.only(left:24),
                      child: TextFormField(
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),
                        keyboardType:TextInputType.number,
                        decoration:InputDecoration(
                          hintText:'*',
                          hintStyle:TextStyle(fontSize:32,fontWeight: FontWeight.bold,color:Colors.grey[500], ),
                          border:InputBorder.none,
                          fillColor:Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Buttonss(text: 'Next', hight: 300, width: 50, color: Colors.deepOrange),
            Padding(
              padding: const EdgeInsets.only(top:32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't Receive?",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                          'Click Here',
                          style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.deepOrange)

                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
