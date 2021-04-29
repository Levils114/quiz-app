import 'package:flutter/material.dart';
import 'package:quiz_project/widgets/question_widget.dart';

class QuizWidget extends StatelessWidget {
  final String titleText;
  final List<Widget> answerWidgets;

  QuizWidget({this.titleText, this.answerWidgets});

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        QuestionWidget(
          title: titleText,
        ),
        ...answerWidgets,
      ],
    ));
  }
}
