import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFeedbackWidget extends StatelessWidget {
  String feedbackText;
  String feedbackValue;
  String av = 'You Averaged';

  MyFeedbackWidget(
      {super.key, required this.feedbackText, required this.feedbackValue});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(color: theme.colorScheme.tertiary, borderRadius: BorderRadius.circular(3), border: Border.all(color: theme.colorScheme.secondary, width: 5, style: BorderStyle.solid)),
      padding: const EdgeInsets.all(10),
      // color: theme.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            flex: 6,
            child: Text(
              feedbackText,
              softWrap: true,
              style: theme.textTheme.labelMedium
                  ?.copyWith(color: theme.colorScheme.onPrimary),
            ),
          ),
          // ],
          // ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  av,
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: theme.colorScheme.onPrimary),
                ),
                Text(
                  feedbackValue,
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: theme.colorScheme.onPrimary),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
