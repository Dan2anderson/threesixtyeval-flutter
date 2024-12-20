import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/widgets/answer_widget.dart';

class SlideAnswerWidget extends AnswerWidget {
  final String leftLabel;
  final String rightLabel;

  const SlideAnswerWidget({super.key, required this.leftLabel, required this.rightLabel, required super.answerModel});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(leftLabel),
              Text(rightLabel),
            ],
          ),
        ),
        Slider(
          inactiveColor: theme.colorScheme.tertiary,
          activeColor: theme.colorScheme.tertiary,
          thumbColor: theme.colorScheme.secondary,
          value: answerModel.answeredValue.toDouble(),
          max: 10,
          divisions: 10,
          label: answerModel.answeredValue.toString(),
          onChanged: (double value) {
            // setState(() {
              answerModel.answeredValue = value.round().toInt();
            // });
          },
        ),
      ],
    );
  }
}
