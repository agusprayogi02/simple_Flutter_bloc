import 'package:fire_login/utils/constants.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String title, subTitle;
  final bool enable;
  final Function(bool val) onChanged;

  const TextBox({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.enable,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Text(
                  title,
                  style: titleStyle(18),
                ),
                Text(
                  subTitle,
                  style: titleStyle(11),
                ),
              ],
            ),
          ),
          Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            child: Checkbox(
              activeColor: primaryColor,
              checkColor: lightColor,
              value: enable,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
