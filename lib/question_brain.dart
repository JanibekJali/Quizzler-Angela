import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:quizller/question_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuestionBrain {
  int _currentQuestionNumber = 0;
  List<QuestionModel> _questionBank = [
    QuestionModel(questionText: 'Kyrgyzstan egemenduu olko', answer: true),
    QuestionModel(questionText: 'Osh Talasta jaigashkan', answer: false),
    QuestionModel(questionText: 'Batkende Aigul gulu bar', answer: true),
  ];

  void nextQuestion() {
    if (_currentQuestionNumber < _questionBank.length - 1) {
      _currentQuestionNumber++;
    } else {
      'Buttu';
    }
    print(_currentQuestionNumber);
    print(_questionBank.length);
  }

  // String getQuestionText(int currentQuestionNumber) {
  String getQuestionText() {
    return _questionBank[_currentQuestionNumber].questionText;
  }

  // bool getQuestionAnswer(int currentQuestionNumber) {
  bool getQuestionAnswer() {
    return _questionBank[_currentQuestionNumber].answer;
  }

  bool isFinished() {
    if (_currentQuestionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _currentQuestionNumber = 0;
  }
}

final QuestionBrain questionBrain = QuestionBrain();
