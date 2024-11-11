import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';

class GiveFeedbackRepository {
  GiveFeedbackModel fetchNeededFeedbackItems() {
///the API will only send back items that should be shown.but as items are completed or dismissed we need to keep track of which items should not be shown to the user.
    ///
    return fakeGiveFeedbackModel;
  }

  void uploadChanges(List<GiveFeedbackItem> changedItems) {
    //no-op till the api is written.
  }
}

GiveFeedbackModel fakeGiveFeedbackModel = GiveFeedbackModel(
    title: 'Please mark every person you have experience working with.',
    giveFeedbackItems: [
      GiveFeedbackItem(personId: 1, name: 'Jane Doe', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 2, name: 'john Doe', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 3, name: 'Jane smith', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 4, name: 'john Smith', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 5, name: 'Billy Joel', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 6, name: 'Bobby Jean', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 7, name: 'Agnes Jane', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 8, name: 'Walker Spane', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 9, name: 'Teddy Bear', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
      GiveFeedbackItem(personId: 10, name: 'Carls Marle', doEvalText: 'Evaluate', noEvalText: 'No Experience', status: FeedbackStatus.active),
    ]);
