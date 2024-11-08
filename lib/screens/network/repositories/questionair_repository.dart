import 'package:three_sixty_evaluations/screens/network/models/questionair_modal.dart';

class QuestionairRepository {
  QuestionairModel fetchQuestionair() {
    return _fakeModel;
  }
}

QuestionairModel _fakeModel = QuestionairModel(indexCurrentQuestion: 0,
    questions: [
  Question(
    qText: 'How good is the quality of /names/ work?',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Low Quality',
    highText: 'High Quality',
  ),
  Question(
    qText: 'How fast does /names/ get his/her work done?',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Slow',
    highText: 'Fast',
  ),
  Question(
    qText: 'How well does /names/ communicate with the rest of the team/leaders/direct reports?',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Not well',
    highText: 'Very Well',
  ),
  Question(
    qText: 'How well does /names/ give praise and recognition when some one else does a good job?',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Not well',
    highText: 'Very Well',
  ),
  Question(
    qText: 'How well does /names/ take responsibility for their own mistakes on the job?',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Not well',
    highText: 'Very Well',
  ),
  Question(
    qText: 'How flexible is /names/ when priorities change? ',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Not flexible',
    highText: 'Very flexible',
  ),
  Question(
    qText: 'How reliable is /names/? ',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Not reliable',
    highText: 'Very reliable',
  ),
  Question(
    qText: 'How often does /names/? help you or others with your own job responsibilities?',
    qId: 1,
    answerType: AnswerType.slidingScale,
    lowText: 'Not often',
    highText: 'Very often',
  ),
]);
