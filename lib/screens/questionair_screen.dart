import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/questionair_viewmodel.dart';
import 'package:three_sixty_evaluations/screens/network/models/answer_model.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/questionair_repository.dart';
import 'package:three_sixty_evaluations/widgets/question_widget.dart';
import 'package:three_sixty_evaluations/widgets/slide_answer_widget.dart';

class QuestionairScreen extends StatelessWidget {
  final nextText = 'Next';
  final submitText = 'Submit';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionairViewModel>(
      create: (context) => QuestionairViewModel(
          questionairRepository: GetIt.instance.get<QuestionairRepository>())
        ..start(),
      child: Consumer<QuestionairViewModel>(
        builder: (context, viewModel, child) =>  Column(
      children: [
        QuestionWidget(
          questionText: viewModel.getCurrentQuestion().qText,
          answerWidget: SlideAnswerWidget(
            leftLabel: viewModel.getCurrentQuestion().lowText,
            rightLabel: viewModel.getCurrentQuestion().highText,
            answerModel: viewModel.getAnswerByCurrentQuestionIndex(),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              viewModel.updateCurrentQuestion();
            },
            child: Text(viewModel.buttonText()),
          ),
        )
      ],
    );
  }
}
