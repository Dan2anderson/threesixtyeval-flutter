import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';

class GiveFeedbackRepository {
  GiveFeedbackModel fetchNeededFeedbackItems() {

    return fakeGiveFeedbackModel;
  }
}

GiveFeedbackModel fakeGiveFeedbackModel = GiveFeedbackModel(
    title: 'Please mark every person you have experience working with.',
    giveFeedbackItems: [
      GiveFeedbackItem(name: 'Jane Doe', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'john Doe', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'Jane smith', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'john Smith', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'Billy Joel', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'Bobby Jean', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'Agnes Jane', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'Walker Spane', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'Teddy Bear', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
      GiveFeedbackItem(name: 'Carls Marle', doEvalText: 'Evaluate', noEvalText: 'No Experience'),
    ]);
