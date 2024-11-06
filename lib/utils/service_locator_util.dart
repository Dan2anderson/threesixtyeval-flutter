
import 'package:get_it/get_it.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/personal_feedback_repository.dart';

class ServiceLocatorUtil {
  static initialize(){
    GetIt.instance.registerLazySingleton(() =>PersonalFeedbackRepository());
}
}