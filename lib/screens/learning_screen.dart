import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Learning Page',
              style: TextStyle(fontSize: 24),
            ),
            // Add educational content here
          ],
        ),
      ),
    );
  }
}
