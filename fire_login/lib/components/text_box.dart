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
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
