import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int score;
  final void Function(String) restartFunction;

  ResultWidget({
    @required this.score,
    @required this.restartFunction,
  });

  String get finalMessage {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Boa menó!';
    } else if (score < 16) {
      return 'É um home!';
    } else {
      return 'Caraca cleitin, tá de hack?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: (Text(
            finalMessage,
            style: TextStyle(
              fontSize: 28,
            ),
          )),
        ),
        TextButton(
          onPressed: () => restartFunction('eae man'),
          child: Text(
            'Reiniciar',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
