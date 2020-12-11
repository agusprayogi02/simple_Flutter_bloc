import 'package:flutter/material.dart';
import 'package:fire_bloc/utils/utils.dart';

class OvalButton extends StatelessWidget {
  const OvalButton({
    Key key,
    this.colorText,
    this.icon,
    this.colorSplash,
    @required this.onTap,
  }) : super(key: key);
  final Color colorText;
  final Color colorSplash;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.blue, // button color
        child: InkWell(
          splashColor: colorSplash ?? Colors.grey, // inkwell color
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              icon ?? Icons.arrow_back_ios_outlined,
              color: colorText ?? whiteC,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
