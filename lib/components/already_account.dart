import 'package:flutter/material.dart';
import 'package:fire_bloc/utils/utils.dart';

class AlreadyAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyAccount({Key key, this.login = true, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: lightC),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(color: lightC, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
