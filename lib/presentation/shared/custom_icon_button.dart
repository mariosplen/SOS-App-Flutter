import 'package:flutter/material.dart';
import 'package:sos/theme/app_palette.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    this.color = AppPalette.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.settings,
        color: color,
        size: 30,
      ),
      iconSize: 30,
    );
  }
}
