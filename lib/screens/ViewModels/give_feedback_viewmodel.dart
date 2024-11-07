import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/give_feedback_repository.dart';

class GiveFeedbackViewModel extends ChangeNotifier {
  final GiveFeedbackRepository giveFeedbackRepository;

  GiveFeedbackViewModel({
    required this.giveFeedbackRepository
  });

  late GiveFeedbackModel _feedbackItems;

  int get numberOfItems => _feedbackItems.giveFeedbackItems.length;
  GiveFeedbackItem feedbackItemByIndex(int index) => _feedbackItems.giveFeedbackItems[index];
  String get title => _feedbackItems.title??'';

  void start(){
    _feedbackItems = giveFeedbackRepository.fetchNeededFeedbackItems();
    notifyListeners();
  }

}