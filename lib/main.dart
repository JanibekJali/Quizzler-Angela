import 'package:flutter/material.dart';
import 'package:quizller/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = <Icon>[
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // )
  ];
  // List<String> questions = <String>[
  //   'Kyrgyzstan egemenduu olko',
  //   'Osh Talasta jaigashkan',
  //   'Batkende Aigul gulu bar'
  // ];
  // List<QuestionModel> questionBank = <QuestionModel>[
  //   QuestionModel(questionText: 'Kyrgyzstan egemenduu olko', answer: true),
  //   QuestionModel(questionText: 'Osh Talasta jaigashkan', answer: false),
  //   QuestionModel(questionText: 'Batkende Aigul gulu bar', answer: true),
  // ];
  // int questionNumber = 0;
  // List<bool> answers = <bool>[
  //   true,
  //   false,
  //   true,
  // ];
  Icon trueAnswer = Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon falseAnswer = Icon(
    Icons.close,
    color: Colors.red,
  );
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBrain.getQuestionAnswer();

    setState(() {
      if (questionBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        questionBrain.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionBrain.nextQuestion();
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
                // questions[questionNumber] ?? 'Suroo',
                // questionBrain.questionBank[questionNumber].questionText,
                // questionBrain.getQuestionText(questionNumber),
                questionBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                // bool correctAnswer = answers[questionNumber];
                // questionBrain.questionBank[questionNumber].answer = true;
                // bool correctAnswer =
                // questionBrain.questionBank[questionNumber].answer;
                // questionBrain.getQuestionAnswer(questionNumber);
                //     questionBrain.getQuestionAnswer();
                // if (correctAnswer == true) {
                //   log('User got it right');
                // } else {
                //   log('User got it wrong');
                // }
                // questionNumber++;
                // log('$questionNumber');
                // setState(() {
                //   questionBrain.nextQuestion();
                // });
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                // bool correctAnswer = answers[questionNumber];
                // bool correctAnswer =
                //     // questionBrain.questionBank[questionNumber].answer;
                //     // questionBrain.getQuestionAnswer(questionNumber);
                //     questionBrain.getQuestionAnswer();
                // if (correctAnswer == false) {
                //   log('User got it right');
                //   // scoreKeeper.add()
                // } else {
                //   log('User got it wrong');
                // }

                // // questionNumber++;
                // // log('$questionNumber');
                // setState(() {
                //   questionBrain.nextQuestion();
                // });
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
