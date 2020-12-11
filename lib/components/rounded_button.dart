import 'package:flutter/material.dart';
import 'package:fire_bloc/utils/utils.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;

  const RoundedButton({
    Key key,
    this.press,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 17, horizontal: 27),
            onPressed: press,
            color: primaryC,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
