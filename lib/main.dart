import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_project/widgets/answer_widget.dart';
import 'package:quiz_project/widgets/question_widget.dart';
import 'package:quiz_project/widgets/quiz_widget.dart';
import 'package:quiz_project/widgets/result_widget.dart';

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (_QuizzAppState());
  }
}

class _QuizzAppState extends State<QuizzApp> {
  var _questionSelected = 0;

  final _questions = const [
    {
      'question': 'Qual sua cor favorita?',
      'answers': ['Black', 'White', 'Grey', 'Blue'],
    },
    {
      'question': 'Qual seu animal favorito?',
      'answers': ['Dog', 'Cat', 'Horse', 'Duck']
    }
  ];

  void _response() {
    if (hasSelectedAnswer) {
      setState(() {
        _questionSelected++;
      });
    }
  }

  bool get hasSelectedAnswer {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers =
        hasSelectedAnswer ? _questions[_questionSelected]['answers'] : [];
    List<Widget> answersWidgets = answers
        .map((answer) => AnswerWidget(
              answerText: answer,
              onSelect: _response,
            ))
        .toList();

    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
          centerTitle: true,
        ),
        body: hasSelectedAnswer
            ? QuizWidget(
                titleText: _questions[_questionSelected]['question'],
                answerWidgets: answersWidgets,
              )
            : ResultWidget(),
      ),
    ));
  }
}
