import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "This app was developed by three university students as a project for the Mobile Development course in May 2024. The team members are: \n\nMarios Plenchidis \nNikoletta Teazi \nDimitra Emmanouilidou \n\nThis emergency app is intended for educational purposes only and should not be used in real emergency situations.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
