
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:three_sixty_evaluations/widgets/give_feedback_widget.dart';

void main() {
  const String feedbackText = 'Dan Jones';
  const String b1Text = 'button text';
  const String b2Text = 'button text 2';
  testWidgets('Widget shows correct info', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Widget testWidget = MaterialApp(
      home: Scaffold(
        body: GiveFeedbackWidget(name: feedbackText, button1Text: b1Text, button2Text: b2Text, id: 1, button1Action: () {  }, button2Action: () {  },
            ),
      ),
    );
    await tester.pumpWidget(testWidget);

    // Verify that our counter starts at 0.
    expect(find.text(feedbackText), findsOneWidget);
    expect(find.text(b1Text), findsOneWidget);
    expect(find.text(b2Text), findsOneWidget);
  });
}
