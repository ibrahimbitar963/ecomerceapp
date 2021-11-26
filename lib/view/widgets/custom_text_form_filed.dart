import 'package:flutter/material.dart';
class Custom_text_form_filed extends StatelessWidget {
final String hint;
final Function onSave;
final Function validator;
final bool password;
Custom_text_form_filed({Key key, this.hint, this.onSave, this.validator,this.password});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: password,
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