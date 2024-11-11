import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/give_feedback_repository.dart';

class GiveFeedbackViewModel extends ChangeNotifier {
  final GiveFeedbackRepository giveFeedbackRepository;

  GiveFeedbackViewModel({
    required this.giveFeedbackRepository
  });

  late GiveFeedbackModel _feedbackModel;
  final List<GiveFeedbackItem> updateItems = [];

  int get numberOfItems => _feedbackModel.giveFeedbackItems.length;
  GiveFeedbackItem feedbackItemByIndex(int index) => _feedbackModel.giveFeedbackItems[index];
  String get title => _feedbackModel.title??'';

  void start(){
    _feedbackModel = giveFeedbackRepository.fetchNeededFeedbackItems();
    notifyListeners();
  }

  void uploadChanges(){
    giveFeedbackRepository.uploadChanges(updateItems);
  }

  void dismissFeedbackByIndex(int index) {
    _feedbackModel.giveFeedbackItems[index].status = FeedbackStatus.dismissed;
    _updateItem(index);
    notifyListeners();
  }

  void feedbackStartedByIndex(int index){
    _feedbackModel.giveFeedbackItems[index].status = FeedbackStatus.inProgress;
    _updateItem(index);
    notifyListeners();
  }
  void feedbackCompletedByIndex(int index){
    _feedbackModel.giveFeedbackItems[index].status = FeedbackStatus.completed;
    _updateItem(index);
    notifyListeners();
  }

  ///does not call notifyListeners().
  void _updateItem(int index){
    GiveFeedbackItem changedItem = _feedbackModel.giveFeedbackItems[index];
    updateItems.add(changedItem);
    uploadChanges();
  }

}