import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
      title: const Text('Terms and Conditions'),
      content: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text:
                  'In order to use this application, you must read and accept the ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'Terms & Conditions',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = onTermsTap,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onAccept,
          child: const Text('Accept'),
        ),
      ],
    );
  }
}
