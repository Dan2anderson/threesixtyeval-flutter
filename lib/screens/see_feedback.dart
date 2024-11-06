import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/see_feedback_viewmodel.dart';
import 'package:three_sixty_evaluations/screens/network/models/personal_feedback_item.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/personal_feedback_repository.dart';
import 'package:three_sixty_evaluations/widgets/my_feedback_widget.dart';

class SeeFeedbackScreen extends StatelessWidget {
  final GetIt serviceLocator = GetIt.instance;

  SeeFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SeeFeedbackViewModel>(
      create: (context) => SeeFeedbackViewModel(
          personalFeedbackRepository:
              serviceLocator.get<PersonalFeedbackRepository>())
        ..start(),
      child: Consumer<SeeFeedbackViewModel>(
        builder: (context, viewModel, child) => Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                Text(
                  'See how you are doing;',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: viewModel.numberOfItems,
                    itemBuilder: (BuildContext context, int index) {
                      PersonalFeedbackItem item =
                      viewModel.feedbackItemByIndex(index);
                      return MyFeedbackWidget(
                          feedbackText: item.questionText ?? '',
                          feedbackValue: item.feedbackText ?? '');
                    }, separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20,);
                  },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
