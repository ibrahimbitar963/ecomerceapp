import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final Alignment alignment;
  final String text;
  final Color color;
  final double fontsize;
  CustomText({
    this.alignment=Alignment.topLeft,
    this.color=Colors.black,
    this.fontsize=16,
    this.text='',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child:    Text(text,
        style: TextStyle(
          color:  color,
          fontSize: fontsize,
        ),
      ),
    );
  }
}
