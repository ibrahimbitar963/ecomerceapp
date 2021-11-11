import 'package:flutter/material.dart';

import 'custom_text.dart';
class custom_social_button extends StatelessWidget {
final String text;
final String imageName;
final Function onPressed;

  custom_social_button({ this.text, this.imageName,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color:  Colors.grey.shade50,

    ),
      child: FlatButton(onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child:Row(
          children: [
            Image.asset(imageName),
            SizedBox(width: 100,),
            CustomText(
              text: text,
            ),
          ],
        ),
      ),
    );
  }

}