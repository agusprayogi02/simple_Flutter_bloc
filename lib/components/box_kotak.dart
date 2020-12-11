import 'package:flutter/material.dart';
import 'package:fire_bloc/utils/utils.dart';

class BoxKotak extends StatelessWidget {
  final Color color;
  final String title;
  final String state;
  final double widht;
  const BoxKotak({
    Key key,
    this.color,
    @required this.title,
    this.state,
    @required this.widht,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      decoration: bkotak(color),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              state,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 4),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
