import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/screens/network/models/answer_model.dart';

abstract class AnswerWidget extends StatefulWidget{

  final Answer answerModel;

  const AnswerWidget({super.key, required this.answerModel});
}