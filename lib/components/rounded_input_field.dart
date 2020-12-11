import 'package:flutter/material.dart';
import 'package:fire_bloc/components/textFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final ValueChanged<String> onChanged;

  const RoundedInputField({Key key, this.icon, this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white, fontFamily: "Poppins"),
            border: InputBorder.none),
      ),
    );
  }
}
