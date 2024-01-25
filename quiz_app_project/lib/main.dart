import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: QuizPage(
                  context: context,
                ),
              ),
            )));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required BuildContext context});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void verifyAnswer(bool userAnswer) {
    setState(() {
      bool correctAnswer = quizBrain.getCorrectAnswer();
      if (userAnswer == correctAnswer) {
        quizBrain.scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        quizBrain.scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizBrain.nextQuestion();
      if (quizBrain.gameEnd) {
        Alert(
                context: context,
                title: "Game Over",
                desc: "You reached the end of the game")
            .show();
        quizBrain.setGameEnd(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                verifyAnswer(true);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text("True",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                verifyAnswer(false);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text("false",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        ),
        Row(
          children: quizBrain.scoreKeeper,
        )
      ],
    );
  }
}
