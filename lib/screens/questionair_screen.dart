import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/questionair_viewmodel.dart';
import 'package:three_sixty_evaluations/screens/network/models/answer_model.dart';
import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/questionair_repository.dart';
import 'package:three_sixty_evaluations/three_sixty_theme.dart';
import 'package:three_sixty_evaluations/widgets/question_widget.dart';
import 'package:three_sixty_evaluations/widgets/slide_answer_widget.dart';

class QuestionairScreen extends StatelessWidget {
  final GiveFeedbackItem feedbackItem;

  const QuestionairScreen({super.key, required this.feedbackItem});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: theme.primaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SafeArea(
        child: _buildhome(context),
      ),
    );
  }

  Widget _buildhome(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider<QuestionairViewModel>(
      create: (context) => QuestionairViewModel(
          questionairRepository: GetIt.instance.get<QuestionairRepository>())
        ..start(feedbackItem.personId),
      child: Consumer<QuestionairViewModel>(
        builder: (context, viewModel, child) => Column(
          children: [
            QuestionWidget(
              name: feedbackItem.name,
              questionText: viewModel.getCurrentQuestion().qText,
              answerWidget: SlideAnswerWidget(
                leftLabel: viewModel.getCurrentQuestion().lowText,
                rightLabel: viewModel.getCurrentQuestion().highText,
                answerModel: viewModel.getAnswerByCurrentQuestionIndex(),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.tertiary,
                  ),
                  onPressed: () {
                    bool hasMoreQuestions = viewModel.progressQuestion();
                    if (!hasMoreQuestions) {
                      // feedbackItem.status = FeedbackStatus.completed;
                      Navigator.pop(context, true);
                    }
                  },
                  child: Text(viewModel.buttonText()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
