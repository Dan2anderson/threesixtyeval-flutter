import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/give_feedback_viewmodel.dart';
import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/give_feedback_repository.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/personal_feedback_repository.dart';
import 'package:three_sixty_evaluations/widgets/give_feedback_widget.dart';

class GiveFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GiveFeedbackViewModel>(
      create: (context) => GiveFeedbackViewModel(
          giveFeedbackRepository: GetIt.instance.get<GiveFeedbackRepository>())
        ..start(),
      child: Consumer<GiveFeedbackViewModel>(
        builder: (context, viewModel, child) => Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  viewModel.title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: viewModel.numberOfItems,
                    itemBuilder: (BuildContext context, int index) {
                      GiveFeedbackItem item =
                          viewModel.feedbackItemByIndex(index);
                      return GiveFeedbackWidget(
                        name: item.name,
                        button1Text: item.doEvalText,
                        button2Text: item.noEvalText,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
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
