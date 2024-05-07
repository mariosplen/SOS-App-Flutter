import 'package:flutter/material.dart';

class ReText extends StatelessWidget {
  const ReText(
    this.text, {
    this.style,
    super.key,
  });
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
