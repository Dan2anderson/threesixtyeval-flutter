import 'package:flutter/material.dart';

class SeeFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stateless Widget'),
      ),
      body: const Center(
        child: Text(
          'SEE FEEDBACK!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}