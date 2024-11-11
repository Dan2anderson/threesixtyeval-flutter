import 'package:get_it/get_it.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/give_feedback_repository.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/personal_feedback_repository.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/questionair_repository.dart';

class ServiceLocatorUtil {
  static initialize() {
    final serviceLocator = GetIt.instance;
    serviceLocator.registerLazySingleton(() => PersonalFeedbackRepository());
    serviceLocator.registerLazySingleton(() => GiveFeedbackRepository());
    serviceLocator.registerLazySingleton(() => QuestionairRepository());
  }
}
