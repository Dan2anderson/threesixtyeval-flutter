import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/screens/network/models/answer_model.dart';
import 'package:three_sixty_evaluations/screens/network/models/questionair_modal.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/questionair_repository.dart';

class QuestionairViewModel extends ChangeNotifier {
  final QuestionairRepository questionairRepository;

  QuestionairViewModel({required this.questionairRepository});

  late QuestionairModel _qModel;
  @visibleForTesting
  late List<Answer> answerModel;
  late int personId;

  void start(int personId) {
    this.personId = personId;
    _qModel = questionairRepository.fetchQuestionair();
    _qModel.indexCurrentQuestion = 0;
    answerModel = [];
    notifyListeners();
  }

  void uploadAnswers() {
    questionairRepository.uploadAnswers(answerModel);
  }

  String buttonText() {
    int currentIndex = _qModel.indexCurrentQuestion;
    int lengthShiftedToIndex = _qModel.questions.length - 1;
    if (currentIndex == lengthShiftedToIndex) {
      return 'Submit';
    } else {
      return 'Next';
    }
  }

  Question getCurrentQuestion() {
    return _qModel.questions[_qModel.indexCurrentQuestion];
  }

  ///updates Viewmodel data to the next question
  ///if there are no more questions to answer returns false.
  bool progressQuestion() {
    bool areNoMoreQuestions = true;
    if (_qModel.indexCurrentQuestion == (_qModel.questions.length - 1)) {
      _qModel.indexCurrentQuestion = 0;
      areNoMoreQuestions = false;
      uploadAnswers();
    } else {
      _qModel.indexCurrentQuestion++;
    }

    notifyListeners();
    return areNoMoreQuestions;
  }

  Answer getAnswerByCurrentQuestionIndex() {
    Question currentQ = _qModel.questions[_qModel.indexCurrentQuestion];
    Iterable<Answer> matchingAnswers =
        answerModel.where((element) => element.qId == currentQ.qId);
    Answer matchingA;
    if (matchingAnswers.length > 1) {
      throw const FormatException(
          'More than one answer exists with the same qId. There should be only one.');
    }
    if (matchingAnswers.isNotEmpty) {
      matchingA = matchingAnswers.first;
    } else {
      matchingA =
          Answer(answeredValue: 5, qId: currentQ.qId, personId: personId);
    }
    return matchingA;
  }
}
