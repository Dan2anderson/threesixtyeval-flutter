import 'package:flutter/material.dart';

class GiveFeedbackWidget extends StatelessWidget {
  final int id;
  final String name;
  final String button1Text;
  final String button2Text;
  final VoidCallback button1Action;
  final VoidCallback button2Action;

  const GiveFeedbackWidget({
    super.key,
    required this.id,
    required this.name,
    required this.button1Text,
    required this.button2Text,
    required this.button1Action,
    required this.button2Action,
  });

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
      // color: theme.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                name,
                softWrap: true,
                style: theme.textTheme.labelMedium
                    ?.copyWith(color: theme.colorScheme.onPrimary),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                  ),
                  onPressed: button1Action,
                  child: Text(
                    button1Text,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.error,
                  ),
                  onPressed: button2Action,
                  child: Text(
                    button2Text,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
