import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String answerText;
  final void Function() onSelect;

  AnswerWidget({this.answerText, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: (ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: onSelect,
        child: Text(
          answerText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      )),
    );
  }
}
