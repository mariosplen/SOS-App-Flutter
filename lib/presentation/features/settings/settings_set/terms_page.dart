import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.terms.tr()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(LocaleKeys.terms.tr()),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
