import 'package:flutter/material.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/presentation/shared/pressable.dart';
import 'package:sos/presentation/shared/re_text.dart';

class PhoneButton extends StatelessWidget {
  const PhoneButton({
    required this.numbers,
    required this.onPressed,
    required this.icon,
    required this.color,
    required this.title,
    super.key,
  });
  final String title;
  final List<String> numbers;
  final void Function() onPressed;
  final AssetGenImage icon;
  final Color color;

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
          color: color,
        ),
        child: Stack(
          children: [
            icon.image(
              opacity: const AlwaysStoppedAnimation(.19),
              scale: 0.5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    numbers.length,
                    (index) => ReText(
                      numbers[index],
                      style: _textStyle,
                    ),
                  ),
                ),
                ReText(
                  title,
                ),
              ],
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
