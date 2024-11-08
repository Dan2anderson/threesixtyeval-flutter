import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/screens/network/models/answer_model.dart';
import 'package:three_sixty_evaluations/screens/network/models/questionair_modal.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/questionair_repository.dart';

class QuestionairViewModel extends ChangeNotifier {
  final QuestionairRepository questionairRepository;

  QuestionairViewModel({required this.questionairRepository});

  late QuestionairModel _qModel;
  late List<Answer> _answerModel;

  void start() {
    _qModel = questionairRepository.fetchQuestionair();
    notifyListeners();
  }

  String buttonText() {
    int currentIndex =_qModel.indexCurrentQuestion;
    int lengthShiftedToIndex = _qModel.questions.length-1;
    if(currentIndex == lengthShiftedToIndex) {
      return 'Submit';
    } else {
      return 'Next';
    }
  }

  Question getCurrentQuestion(){
    return _qModel.questions[_qModel.indexCurrentQuestion];
  }

  void updateCurrentQuestion() {
    _qModel.indexCurrentQuestion++;
    notifyListeners();
  }

  Answer getAnswerByCurrentQuestionIndex() {
    Question currentQ = _qModel.questions[_qModel.indexCurrentQuestion];
    Iterable<Answer> matchingAnswers = _answerModel.where((element) => element.qId == currentQ.qId);
    Answer matchingA;
    if(matchingAnswers.length >1){
      throw const FormatException('More than one answer exists with the same qId. There should be only one.');
    }
    if(matchingAnswers.isNotEmpty){
      matchingA = matchingAnswers.first;
    } else {
      matchingA = Answer(answeredValue: 0, qId: currentQ.qId);
    }
    return matchingA;
  }

  Answer getAnswerByQId(int id) {
   Iterable<Answer> matchingAnswers = _answerModel.where((element) => element.qId == id);
   Answer matchingA;
   if(matchingAnswers.isNotEmpty){
     matchingA = matchingAnswers.first;
   } else {
     Iterable<Question> matchingQuestions = _qModel.questions.where((element) => element.qId == id);
     Question matchingQ;
     if(matchingQuestions.isNotEmpty){
       matchingQ = matchingQuestions.first;
     } else {
       throw const FormatException('a qId was passed to getAnswerByQId that does not exist in the question set.');
     }
       matchingA = Answer(qId: matchingQ.qId, answeredValue: 0);
   }
   return matchingA;
  }

}