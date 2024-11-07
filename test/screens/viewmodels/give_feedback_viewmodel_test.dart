
import 'package:flutter_test/flutter_test.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/give_feedback_viewmodel.dart';
import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/give_feedback_repository.dart';

void main() {
  late GiveFeedbackViewModel viewModel;
  final GiveFeedbackRepository mockRepository = MockGiveFeedbackRepository();

  setUpAll(() {
    viewModel = GiveFeedbackViewModel(giveFeedbackRepository: mockRepository);
  });
  test('SeeFecbackViewModel initializes the correct data on start()', () async {
    viewModel.start();

    expect(viewModel.numberOfItems, 10);
    expect(viewModel.feedbackItemByIndex(0).name, 'Jane Doe');
    expect(viewModel.feedbackItemByIndex(0).status, FeedbackStatus.active);

    viewModel.dismissFeedbackByIndex(0);

    expect(viewModel.feedbackItemByIndex(0).status, FeedbackStatus.dismissed);
    expect(viewModel.feedbackItemByIndex(1).status, FeedbackStatus.active);
    expect(viewModel.feedbackItemByIndex(2).status, FeedbackStatus.active);
    expect(viewModel.feedbackItemByIndex(9).status, FeedbackStatus.active);
    expect(viewModel.numberOfItems, 10);

    viewModel.feedbackStartedByIndex(2);
    expect(viewModel.feedbackItemByIndex(0).status, FeedbackStatus.dismissed);
    expect(viewModel.feedbackItemByIndex(2).status, FeedbackStatus.inProgress);
    expect(viewModel.feedbackItemByIndex(1).status, FeedbackStatus.active);
    expect(viewModel.feedbackItemByIndex(9).status, FeedbackStatus.active);
    expect(viewModel.numberOfItems, 10);

  });


}

class MockGiveFeedbackRepository extends GiveFeedbackRepository {

}