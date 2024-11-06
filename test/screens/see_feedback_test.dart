import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/personal_feedback_repository.dart';
import 'package:three_sixty_evaluations/screens/see_feedback.dart';

import 'see_feedback_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PersonalFeedbackRepository>(),
])
void main() {
  setUpAll(() {
    PersonalFeedbackRepository mockRepository =
        MockPersonalFeedbackRepository();
    GetIt serviceLocator = GetIt.instance;
    serviceLocator
        .registerSingleton<PersonalFeedbackRepository>(mockRepository);
    when(mockRepository.fetchPersonalFeedback())
        .thenReturn(fakePersonalFeedbackData);
  });
  testWidgets('Home page shows first.', (WidgetTester tester) async {
// Build our app and trigger a frame.
    Widget widget = MaterialApp(
      home: Scaffold(
        body: SeeFeedbackScreen(),
      ),
    );
    await tester.pumpWidget(widget);

    expect(find.text('See how you are doing;'), findsOneWidget);
    expect(find.text('How fast does Bob get work done?'), findsOneWidget);
  });
}
