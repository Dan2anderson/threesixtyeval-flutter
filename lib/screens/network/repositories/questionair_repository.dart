import 'package:three_sixty_evaluations/screens/network/models/answer_model.dart';
import 'package:three_sixty_evaluations/screens/network/models/questionair_modal.dart';

class QuestionairRepository {
  QuestionairModel fetchQuestionair() {
    return _fakeModel;
  }

  void uploadAnswers(List<Answer> answers){
    //no-op untill we have an api.
  }
}

QuestionairModel _fakeModel = QuestionairModel(indexCurrentQuestion: 0,
    questions: [
  Question(
    qText: 'How good is the quality of {name}\'s work?',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Low Quality',
    highText: 'High Quality',
  ),
  Question(
    qText: 'How fast does {name} get his/her work done?',
    qId: 2,
    answerType: AnswerType.slidingScale,
    lowText: 'Slow',
    highText: 'Fast',
  ),
  Question(
    qText: 'How well does {name} communicate with the rest of the team/leaders/direct reports?',
    qId: 3,
    answerType: AnswerType.slidingScale,
    lowText: 'Not well',
    highText: 'Very Well',
  ),
  Question(
    qText: 'How well does {name} give praise and recognition when some one else does a good job?',
    qId: 4,
    answerType: AnswerType.slidingScale,
    lowText: 'Not well',
    highText: 'Very Well',
  ),
  Question(
    qText: 'How well does {name} take responsibility for her/his own mistakes on the job?',
    qId: 5,
    answerType: AnswerType.slidingScale,
    lowText: 'Not well',
    highText: 'Very Well',
  ),
  Question(
    qText: 'How flexible is {name} when priorities change? ',
    qId: 6,
    answerType: AnswerType.slidingScale,
    lowText: 'Not flexible',
    highText: 'Very flexible',
  ),
  Question(
    qText: 'How reliable is {name}? ',
    qId: 7,
    answerType: AnswerType.slidingScale,
    lowText: 'Not reliable',
    highText: 'Very reliable',
  ),
  Question(
    qText: 'How often does {name} help you or others with your own job responsibilities?',
    qId: 8,
    answerType: AnswerType.slidingScale,
    lowText: 'Not often',
    highText: 'Very often',
  ),
]);
