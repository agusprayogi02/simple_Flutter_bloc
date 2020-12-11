import 'package:flutter/material.dart';
import 'package:fire_bloc/utils/utils.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size.width * 0.8,
      decoration:
          BoxDecoration(color: lightC, borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
