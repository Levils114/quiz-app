import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_project/widgets/answer_widget.dart';
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
  var _score = 0;

  final _questions = const [
    {
      'question': 'Qual sua cor favorita?',
      'answers': [
        {'score': 5, 'text': 'Black'},
        {'score': 10, 'text': 'White'},
        {'score': 2, 'text': 'Grey'},
        {'score': 8, 'text': 'Blue'},
      ],
    },
    {
      'question': 'Qual seu animal favorito?',
      'answers': [
        {'score': 10, 'text': 'Dog'},
        {'score': 2, 'text': 'Cat'},
        {'score': 3, 'text': 'Horse'},
        {'score': 5, 'text': 'Duck'},
      ]
    }
  ];

  void _response(int scoreToAdd) {
    if (hasSelectedAnswer) {
      setState(() {
        _questionSelected++;
        _score += scoreToAdd;
      });
    }
  }

  void _restart(String justToSeeInderectComunication) {
    setState(() {
      _questionSelected = 0;
      _score = 0;

      print(justToSeeInderectComunication);
    });
  }

  bool get hasSelectedAnswer {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasSelectedAnswer ? _questions[_questionSelected]['answers'] : [];
    List<Widget> answersWidgets = answers
        .map((answer) => AnswerWidget(
              answerText: answer['text'],
              onSelect: () => _response(answer['score']),
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
            : ResultWidget(
                score: _score,
                restartFunction: _restart,
              ),
      ),
    ));
  }
}
