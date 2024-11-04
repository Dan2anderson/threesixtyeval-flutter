import 'package:flutter/material.dart';
import 'package:three_sixty_evaluations/screens/give_feedback.dart';
import 'package:three_sixty_evaluations/screens/landing_page.dart';
import 'package:three_sixty_evaluations/screens/see_feedback.dart';
import 'package:three_sixty_evaluations/three_sixty_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: threeSixtyTheme,
      home: const BottomNavBarPage(),
    );
  }
}

List<BottomNavigationBarItem> navItems = const [
  BottomNavigationBarItem(
      icon: Icon(Icons.add_business_outlined), label: 'Home'),
  BottomNavigationBarItem(
      icon: Icon(Icons.add_chart_rounded), label: 'See Feedback'),
  BottomNavigationBarItem(
      icon: Icon(Icons.account_tree), label: 'Give Feedback'),
];

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({
    super.key,
  });

  @override
  State<BottomNavBarPage> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavBarPage> {
  int _index = 0;

  @visibleForTesting
  int get getIndex => _index;

  void _onNavTapped(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        currentIndex: _index,
        onTap: _onNavTapped,
      ),
      body: SafeArea(
        child: _navigationWidgets[_index],
      ),
    );
  }
}

List<Widget> _navigationWidgets = [
  const LandingPage(),
  SeeFeedbackScreen(),
  GiveFeedbackScreen(),
];
