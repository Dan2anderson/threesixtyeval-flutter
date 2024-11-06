import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:three_sixty_evaluations/widgets/my_feedback_widget.dart';

void main() {
  const String feedbackText = 'some question text';
  const String valueText = '9 out of 10';
  const String avTextToCheck = 'You Averaged';
  testWidgets('Widget shows correct info', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Widget testWidget = MaterialApp(
      home: Scaffold(
        body: MyFeedbackWidget(
            feedbackText: feedbackText, feedbackValue: valueText),
      ),
    );
    await tester.pumpWidget(testWidget);

    // Verify that our counter starts at 0.
    expect(find.text(feedbackText), findsOneWidget);
    expect(find.text(valueText), findsOneWidget);
  });
}
