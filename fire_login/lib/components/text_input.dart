import 'package:flutter/material.dart';
import 'package:fire_login/utils/constants.dart';

class TextInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function(String x) onChange;
  final Function() onTap;
  final Icon iconRight;
  final bool enable;
  final TextEditingController controller;
  final bool isPass;
  final Function(String val) value;
  const TextInput({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.controller,
    this.onChange,
    this.onTap,
    this.iconRight,
    this.enable,
    this.isPass,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: inputBoxDecoration,
      margin: EdgeInsets.only(top: 12),
      child: TextFormField(
        controller: controller,
        obscureText: isPass ?? false,
        onChanged: onChange,
        decoration: InputDecoration(
          fillColor: Colors.red,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink, width: 1)),
          prefixIcon: Icon(icon),
          suffixIcon: iconRight,
          labelText: label,
        ),
        validator: (val) => val.length < 6 ? label + ' too short.' : null,
        onSaved: value,
        enabled: enable ?? true,
        onTap: onTap,
      ),
    );
  }
}
