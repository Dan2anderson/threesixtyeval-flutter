import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/widgets/answer_widget.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;
  final AnswerWidget answerWidget;

  const QuestionWidget(
      {super.key, required this.questionText, required this.answerWidget});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(
            questionText,
            softWrap: true,
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.primary),
          ),
        ),
        answerWidget,
      ],
    );
  }
}
