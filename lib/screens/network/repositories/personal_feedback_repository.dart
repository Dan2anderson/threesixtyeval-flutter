import 'package:three_sixty_evaluations/screens/network/models/personal_feedback_item.dart';

class PersonalFeedbackRepository {

  PersonalFeedback fetchPersonalFeedback() {
    return fakePersonalFeedbackData;
  }

}

PersonalFeedback fakePersonalFeedbackData = PersonalFeedback(feedbackItems: <PersonalFeedbackItem>[
  PersonalFeedbackItem(questionText: 'How fast does Bob get work done?', feedbackText: '9 out of 10'),
  PersonalFeedbackItem(questionText: 'What is the quality of Bob\'s work?', feedbackText: '8 out of 10'),
  PersonalFeedbackItem(questionText: 'How often does Bob help other co workers?', feedbackText: '9 out of 10'),
  PersonalFeedbackItem(questionText: 'In a world were Bob does a lot of work and every one else does very little work,but Bob is very nice and works extra time and hellps every one out what are the chances you think Bob will get promoted and will every one be happy for Bobs promotion?', feedbackText: '9 out of 10'),
  PersonalFeedbackItem(questionText: 'In a world were Bob does a lot of work and every one else does very little work,but Bob is very nice and works extra time and hellps every one out what are the chances you think Bob will get promoted and will every one be happy for Bobs promotion?', feedbackText: '9 out of 10'),
  PersonalFeedbackItem(questionText: 'Do you like Bob?', feedbackText: '9 out of 10'),
  PersonalFeedbackItem(questionText: 'Does Bob like you?', feedbackText: '9 out of 10'),
  PersonalFeedbackItem(questionText: 'Should Bob by every one a beer?', feedbackText: '9 out of 10'),
  PersonalFeedbackItem(questionText: 'Should we rename Bob to Bill?', feedbackText: '9 out of 10'),
]);