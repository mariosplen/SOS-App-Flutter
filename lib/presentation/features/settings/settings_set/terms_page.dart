import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String terms = '.....';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(terms),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
