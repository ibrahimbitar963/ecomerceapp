import 'package:flutter/material.dart';
class Custom_text_form_filed extends StatelessWidget {
final String hint;
final Function onSave;
final Function validator;
Custom_text_form_filed({Key key, this.hint, this.onSave, this.validator});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.white,
      ),
    );
  }
}