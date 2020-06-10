import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final String hintText;
  final IconData prefixIconData;
  final bool obscureText;
  final Function onChanged;
  TextFieldWidget({
      this.hintText, this.prefixIconData, this.obscureText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
    // onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18.0,
        ),

      ),
    );
  }
}
