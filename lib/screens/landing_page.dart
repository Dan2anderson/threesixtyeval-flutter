import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_sixty_evaluations/screens/ViewModels/landing_page_view_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LandingPageViewModel>(
      create: (context) => LandingPageViewModel()..start(),
      child: Consumer<LandingPageViewModel>(
        builder: (context, viewModel, child) => Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                child: Text(
                  viewModel.title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  viewModel.subTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Image(image: AssetImage('images/happyworkers.png'))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
