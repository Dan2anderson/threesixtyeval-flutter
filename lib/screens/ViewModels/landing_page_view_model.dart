import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/screens/network/models/landing_page_model.dart';

class LandingPageViewModel extends ChangeNotifier {
  late LandingPageModel _pageInfo;

  String get title => _pageInfo.title ?? '';
  String get subTitle => _pageInfo.subTitle ?? '';
  String get giveText => _pageInfo.giveFeedback ?? '';
  String get seeText => _pageInfo.seeFeedback ?? '';

  void start(){
      _pageInfo = LandingPageModel();
      notifyListeners();
  }

}