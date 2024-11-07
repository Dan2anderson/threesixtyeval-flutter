import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:three_sixty_evaluations/widgets/answer_widget.dart';
import 'package:three_sixty_evaluations/widgets/question_widget.dart';

void main() {
  const String qText = 'some question text';
  const String mockAnswerText = 'test widget text field';

  testWidgets('question widget shows correct info', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Widget testWidget = MaterialApp(
      home: Scaffold(
        body: QuestionWidget(questionText: qText, answerWidget: MockAnswerWidget(mockAnswerText: mockAnswerText,)),
      ),
    );
    await tester.pumpWidget(testWidget);

    // Verify that our counter starts at 0.
    expect(find.text(mockAnswerText), findsOneWidget);
    expect(find.text(qText), findsOneWidget);

  });
}

class MockAnswerWidget extends AnswerWidget {
  final String mockAnswerText;

  MockAnswerWidget({ required this.mockAnswerText});

  @override
  Widget build(BuildContext context) {
    return Text(mockAnswerText);
  }

}