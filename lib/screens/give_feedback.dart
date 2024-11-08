import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/give_feedback_viewmodel.dart';
import 'package:three_sixty_evaluations/screens/network/models/give_feedback_model.dart';
import 'package:three_sixty_evaluations/screens/network/repositories/give_feedback_repository.dart';
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
                  child: ListView.builder(
                    itemCount: viewModel.numberOfItems,
                    itemBuilder: (BuildContext context, int index) {
                      GiveFeedbackItem item =
                          viewModel.feedbackItemByIndex(index);
                      double height = 135;
                      if (item.status == FeedbackStatus.dismissed ||
                          item.status == FeedbackStatus.completed) {
                        height = 0;
                      }
                      return AnimatedContainer(
                        // Use the properties stored in the State class.
                        // width: _width,
                        height: height,
                        duration: const Duration(seconds: 1),
                        // Provide an optional curve to make the animation feel smoother.
                        curve: Curves.fastOutSlowIn,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GiveFeedbackWidget(
                            id: item.id,
                            name: item.name,
                            button1Text: item.doEvalText,
                            button2Text: item.noEvalText,
                            button1Action: () {
                              viewModel.feedbackStartedByIndex(index);
                            },
                            button2Action: () {
                              viewModel.dismissFeedbackByIndex(index);
                            },
                          ),
                        ),
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
