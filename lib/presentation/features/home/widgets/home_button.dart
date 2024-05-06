import 'package:flutter/material.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/presentation/shared/pressable.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });
  final String text;
  final void Function() onPressed;
  final AssetGenImage icon;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(40);
    return Pressable(
      onTap: onPressed,
      borderRadius: radius,
      child: Container(
        height: 78,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: const Color(0xFFF0AE61),
        ),
        child: Stack(
          children: [
            icon.image(),
            Center(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
