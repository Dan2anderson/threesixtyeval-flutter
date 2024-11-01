import 'package:flutter/material.dart';

class GiveFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stateless Widget'),
      ),
      body: const Center(
        child: Text(
          'GIVE FEEDBACK!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}