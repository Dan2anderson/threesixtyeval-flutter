class GiveFeedbackModel {
  final String? title;
  final List<GiveFeedbackItem> giveFeedbackItems;

  GiveFeedbackModel({required this.title, required this.giveFeedbackItems});
}

class GiveFeedbackItem {
  final String name;
  final String doEvalText;
  final String noEvalText;

  GiveFeedbackItem(
      {required this.name, required this.doEvalText, required this.noEvalText});
}
