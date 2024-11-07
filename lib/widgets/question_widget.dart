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
    return Container(
      decoration: BoxDecoration(
          color: theme.colorScheme.tertiary,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              color: theme.colorScheme.secondary,
              width: 5,
              style: BorderStyle.solid)),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Text(
              questionText,
              softWrap: true,
              style: theme.textTheme.labelMedium
                  ?.copyWith(color: theme.colorScheme.onPrimary),
            ),
          ),
          answerWidget
        ],
      ),
    );
  }
}
