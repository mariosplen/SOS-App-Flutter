import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';
import 'package:sos/presentation/features/settings/settings_set/widgets/language_dropdown.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.language.tr()),
      ),
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: LanguageDropdown(),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
