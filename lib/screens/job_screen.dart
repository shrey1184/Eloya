import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Job Page',
              style: TextStyle(fontSize: 24),
            ),
            // Add job listings here
          ],
        ),
      ),
    );
  }
}
