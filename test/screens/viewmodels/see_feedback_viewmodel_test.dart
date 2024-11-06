// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:mockito/mockito.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/see_feedback_viewmodel.dart';

import 'package:three_sixty_evaluations/screens/network/models/personal_feedback_item.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/personal_feedback_repository.dart';

void main() {
  late SeeFeedbackViewModel viewModel;
  final PersonalFeedbackRepository mockRepository = MockPersonalFeedbackRepository();

  setUpAll(() {
    viewModel = SeeFeedbackViewModel(personalFeedbackRepository: mockRepository);
  });
  test('SeeFecbackViewModel initializes the correct data on start()', () async {
    viewModel.start();

    expect(viewModel.numberOfItems, 9);
    expect(viewModel.feedbackItemByIndex(0).feedbackText, '9 out of 10');
    expect(viewModel.feedbackItemByIndex(0).questionText, 'How fast does Bob get work done?');
    expect(viewModel.feedbackItemByIndex(8).feedbackText, '9 out of 10');
    expect(viewModel.feedbackItemByIndex(8).questionText, 'Should we rename Bob to Bill?');
  });


}

class MockPersonalFeedbackRepository extends PersonalFeedbackRepository {

}