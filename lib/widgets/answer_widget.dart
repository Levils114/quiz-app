import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String answerText;

  AnswerWidget({this.answerText});

  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: null,
      child: Text(answerText),
    ));
  }
}
