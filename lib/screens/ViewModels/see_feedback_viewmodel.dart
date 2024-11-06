import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/screens/network/models/personal_feedback_item.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/personal_feedback_repository.dart';

class SeeFeedbackViewModel extends ChangeNotifier {
  final PersonalFeedbackRepository personalFeedbackRepository;

  SeeFeedbackViewModel({
    required this.personalFeedbackRepository
});

  late PersonalFeedback _usersFeedback;

  int get numberOfItems => _usersFeedback.feedbackItems.length;
  PersonalFeedbackItem feedbackItemByIndex(int index) => _usersFeedback.feedbackItems[index];

  void start(){
    _usersFeedback = personalFeedbackRepository.fetchPersonalFeedback();
    notifyListeners();
  }

}