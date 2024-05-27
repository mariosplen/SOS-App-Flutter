import 'package:flutter/material.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/gen/fonts.gen.dart';
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
    final radius = BorderRadius.circular(7);
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
            icon.image(
              opacity: const AlwaysStoppedAnimation(.26),
              scale: 0.5,
            ),
            Center(
              child: Text(
                text,
                style: _textStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle _textStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w500,
  wordSpacing: 0.5,
  height: 20 / 14,
);
