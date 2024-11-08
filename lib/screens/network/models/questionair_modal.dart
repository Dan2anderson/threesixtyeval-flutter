class QuestionairModel {
  List<Question> questions;
  int indexCurrentQuestion;
  QuestionairModel({required this.questions, required this.indexCurrentQuestion});
}

class Question {
  String qText;
  int qId;
  String lowText;
  String highText;
  AnswerType answerType;
  Question({required this.qText, required this.qId, required this.lowText, required this.highText, required this.answerType});
}

enum AnswerType {slidingScale}