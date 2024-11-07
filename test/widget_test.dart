// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:three_sixty_evaluations/main.dart';
import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';
import 'package:three_sixty_evaluations/screens/network/models/personal_feedback_item.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/give_feedback_repository.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/personal_feedback_repository.dart';

import 'widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PersonalFeedbackRepository>(),MockSpec<GiveFeedbackRepository>(),])
void main() {

  const String testGiveTitle = 'test title';
  
  setUpAll(() {
    PersonalFeedbackRepository mockPersonalFeedbackRepository = MockPersonalFeedbackRepository();
    GiveFeedbackRepository mockGiveFeedbackRepository = MockGiveFeedbackRepository();

    GetIt serviceLocator = GetIt.instance;
        serviceLocator.registerSingleton<PersonalFeedbackRepository>(mockPersonalFeedbackRepository);
        serviceLocator.registerSingleton<GiveFeedbackRepository>(mockGiveFeedbackRepository);
    when(mockPersonalFeedbackRepository.fetchPersonalFeedback()).thenReturn(PersonalFeedback(feedbackItems: []));
    when(mockGiveFeedbackRepository.fetchNeededFeedbackItems()).thenReturn(GiveFeedbackModel(title: testGiveTitle, giveFeedbackItems: []));
  });
  testWidgets('Home page shows first.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we start on the home page
    expect(find.text('360° Evaluations'), findsOneWidget);
  });

  testWidgets('bottom bar navigation works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the see feedback icon navigates to the see feedback page.
    await tester.tap(find.text('See Feedback'));
    await tester.pump();

    expect(find.text('360° Evaluations'), findsNothing);
    expect(find.text(testGiveTitle), findsNothing);
    expect(find.text('See how you are doing;'), findsOneWidget);

    // Tap the give feedback icon navigates to the see feedback page.
    await tester.tap(find.text('Give Feedback'));
    await tester.pump();

    expect(find.text('360° Evaluations'), findsNothing);
    expect(find.text(testGiveTitle), findsOneWidget);
    expect(find.text('See how you are doing;'), findsNothing);

    // Tap the Home icon navigates to home page.
    await tester.tap(find.text('Home'));
    await tester.pump();

    expect(find.text('360° Evaluations'), findsOneWidget);
    expect(find.text(testGiveTitle), findsNothing);
    expect(find.text('See how you are doing;'), findsNothing);

  });
}
