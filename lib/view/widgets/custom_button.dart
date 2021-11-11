import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custom_text.dart';
class CustomButton extends StatelessWidget {
final String text;
final Function onpressed;

   CustomButton({this.text, this.onpressed});


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onpressed,
      padding: EdgeInsets.all(14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: PrimayColor,
      child: CustomText(
        color: Colors.white ,
        alignment:Alignment.center ,
        fontsize:16 ,
        text: text,
      ),);
  }
}