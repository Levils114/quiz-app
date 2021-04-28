import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_project/widgets/answer_widget.dart';
import 'package:quiz_project/widgets/question_widget.dart';

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

  final List<String> questions = [
    'Qual é a sua cor preferida?',
    'Qual é o seu animal preferido?'
  ];

  void _response() {
    setState(() {
      if (questions.length - 1 > _questionSelected) {
        _questionSelected++;
      } else if (questions.length - 1 == _questionSelected) {
        _questionSelected = _questionSelected - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            QuestionWidget(
              title: questions[_questionSelected],
            ),
            AnswerWidget(answerText: 'Resposta 1'),
            AnswerWidget(answerText: 'Resposta 2'),
            AnswerWidget(answerText: 'Resposta 3'),
          ],
        ),
      ),
    ));
  }
}
