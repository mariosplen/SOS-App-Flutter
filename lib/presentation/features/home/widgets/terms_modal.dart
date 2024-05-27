import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';

class TermsModal extends StatelessWidget {
  const TermsModal({
    required this.onAccept,
    required this.onTermsTap,
    super.key,
  });

  final void Function() onAccept;
  final void Function() onTermsTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.terms_and_conditions.tr()),
      content: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: LocaleKeys.accept_terms_prompt.tr(),
              style: const TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: LocaleKeys.terms_and_conditions.tr(),
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = onTermsTap,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: onAccept, child: Text(LocaleKeys.accept.tr())),
      ],
    );
  }
}
