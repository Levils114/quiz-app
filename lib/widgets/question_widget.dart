import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String title;

  QuestionWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      child: (Text(
        title,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      )),
    );
  }
}
