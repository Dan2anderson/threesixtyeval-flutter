class GiveFeedbackModel {
  final String? title;
  final List<GiveFeedbackItem> giveFeedbackItems;

  GiveFeedbackModel({required this.title, required this.giveFeedbackItems});
}

class GiveFeedbackItem {
  final int personId;
  final String name;
  final String doEvalText;
  final String noEvalText;
  FeedbackStatus status;

  GiveFeedbackItem(
      {required this.personId, required this.name, required this.doEvalText, required this.noEvalText, required this.status});
}


enum FeedbackStatus {active, inProgress, completed, dismissed,}