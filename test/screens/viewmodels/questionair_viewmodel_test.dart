import 'package:flutter_test/flutter_test.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/questionair_viewmodel.dart';
import 'package:three_sixty_evaluations/screens/network/models/answer_model.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/questionair_repository.dart';

void main() {
  late QuestionairViewModel viewModel;
  final QuestionairRepository mockRepository = MockQuestionairRepository();

  setUpAll(() {
    viewModel = QuestionairViewModel(questionairRepository: mockRepository);
  });
  test('QuestionairViewModel initializes the correct data on start() and progressQuestions functions correctly.', () async {
    viewModel.start();

    expect(viewModel.answerModel.length, 0);
    expect(viewModel.getCurrentQuestion().qText, 'How good is the quality of {name}\'s work?');
    expect(viewModel.getCurrentQuestion().qId, 1);
    bool hasMoreQuestions =viewModel.progressQuestion();
    expect(viewModel.getCurrentQuestion().qText, 'How fast does {name} get his/her work done?');
    expect(viewModel.getCurrentQuestion().qId, 2);
    expect(hasMoreQuestions, true);
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    bool hasMoreQuestions2 = viewModel.progressQuestion();
    expect(viewModel.getCurrentQuestion().qText, 'How often does {name} help you or others with your own job responsibilities?');
    expect(viewModel.getCurrentQuestion().qId, 8);
    expect(hasMoreQuestions2, true);
    bool hasMoreQuestions3 = viewModel.progressQuestion();
    expect(viewModel.getCurrentQuestion().qText, 'How good is the quality of {name}\'s work?');
    expect(viewModel.getCurrentQuestion().qId, 1);
    expect(hasMoreQuestions3, false);

  });
  test('QuestionairViewModel gets correct button text', () async {
    viewModel.start();
    final btext = viewModel.buttonText();
    expect(btext, 'Next');
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    final btext1 = viewModel.buttonText();
    expect(btext1, 'Next');
    viewModel.progressQuestion();
    final btext2 = viewModel.buttonText();
    expect(btext2, 'Submit');
  });
  test('QuestionairViewModel getAnswerByCurrentQuestionIndex creates the correct answer', () async {
    viewModel.start();
    final answer1 = viewModel.getAnswerByCurrentQuestionIndex();
    expect(answer1.qId, 1);
    expect(answer1.answeredValue, 5);
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    final answer2 = viewModel.getAnswerByCurrentQuestionIndex();
    expect(answer2.qId, 7);
    expect(answer2.answeredValue, 5);
    viewModel.progressQuestion();
    final answer3 = viewModel.getAnswerByCurrentQuestionIndex();
    expect(answer3.qId, 8);
    expect(answer3.answeredValue, 5);
  });
  test('QuestionairViewModel getAnswerByCurrentQuestionIndex gets the correct answer', () async {
    viewModel.start(123);
    viewModel.answerModel.addAll(testAnswers);
    final answer1 = viewModel.getAnswerByCurrentQuestionIndex();
    expect(answer1.qId, 1);
    expect(answer1.answeredValue, 8);
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    viewModel.progressQuestion();
    final answer2 = viewModel.getAnswerByCurrentQuestionIndex();
    expect(answer2.qId, 7);
    expect(answer2.answeredValue, 10);
    viewModel.progressQuestion();
    final answer3 = viewModel.getAnswerByCurrentQuestionIndex();
    expect(answer3.qId, 8);
    expect(answer3.answeredValue, 10);
  });
}

List<Answer> testAnswers  = [
  Answer(answeredValue: 8, qId: 1, personId: 123),
  Answer(answeredValue: 2, qId: 2, personId: 123),
  Answer(answeredValue: 10, qId: 3, personId: 123),
  Answer(answeredValue: 10, qId: 4, personId: 123),
  Answer(answeredValue: 10, qId: 5, personId: 123),
  Answer(answeredValue: 10, qId: 6, personId: 123),
  Answer(answeredValue: 10, qId: 7, personId: 123),
  Answer(answeredValue: 10, qId: 8, personId: 123),
];

class MockQuestionairRepository extends QuestionairRepository {

}