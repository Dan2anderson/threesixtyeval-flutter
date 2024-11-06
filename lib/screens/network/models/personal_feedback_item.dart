class PersonalFeedback {
  List<PersonalFeedbackItem> feedbackItems;

  PersonalFeedback({
    required this.feedbackItems,
  });
}

class PersonalFeedbackItem {
  String? questionText;
  String? feedbackText;

  PersonalFeedbackItem({
    required this.questionText,
    required this.feedbackText,
  });
}
