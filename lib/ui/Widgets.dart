import 'package:flutter/material.dart';

Container BorderText(String text,TextInputType textInputType, bool status){
  return Container(
    padding:EdgeInsets.only(top:20,right:36,left:24),
    child:Card(
      shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(20),
      ),
      color:Colors.grey[300],
      child: Container(
        padding:EdgeInsets.only(left:24),
        child: TextFormField(
          obscureText:status,
          keyboardType:textInputType,
          decoration:InputDecoration(
            hintText:text,
            hintStyle:TextStyle(fontSize:17,fontWeight: FontWeight.w400,color:Colors.grey[500], ),
            border:InputBorder.none,
            fillColor:Colors.white,
          ),
        ),
      ),
    ),
  );
}
ElevatedButton Buttonss({required String text  ,required double hight,required double width,required Color color})
{
  return ElevatedButton(
    onPressed: () {},
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(text,style: TextStyle(color:Colors.white,fontSize: 18),),
      ],
    ),
    style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize: Size(hight,width),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50))),
  );
}