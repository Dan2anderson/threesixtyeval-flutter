import 'package:flutter/material.dart';

abstract class AnswerWidget extends StatelessWidget{

  late int _selectedAnswerCode;
  int get selectedAnswerCode => _selectedAnswerCode;

  void updateSelectedAnswer(int selectedAnswerCode) {
    _selectedAnswerCode = selectedAnswerCode;
  }

}