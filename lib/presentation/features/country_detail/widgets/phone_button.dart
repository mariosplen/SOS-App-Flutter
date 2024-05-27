import 'package:flutter/material.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/presentation/shared/pressable.dart';

class PhoneButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const PhoneButton({
    required this.numbers,
    required this.onPressed,
    required this.icon,
    required this.color,
    required this.title,
    this.titleTextStyle,
    this.numbersTextStyle,
  });

  final String title;
  final List<String> numbers;
  final void Function() onPressed;
  final AssetGenImage icon;
  final Color color;
  final TextStyle? titleTextStyle;
  final TextStyle? numbersTextStyle;

  @override
  Widget build(BuildContext context) {
    const defaultTitleTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontFamily: FontFamily.roboto,
    );
    const defaultNumbersTextStyle = TextStyle(
      fontSize: 40,
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontFamily: FontFamily.roboto,
    );

    final radius = BorderRadius.circular(7);
    return Pressable(
      onTap: onPressed,
      borderRadius: radius,
      child: Container(
        height: 85,
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
                    (index) => Text(
                      numbers[index],
                      style: numbersTextStyle ?? defaultNumbersTextStyle,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -12), //bring number and text closer
                  child: Text(
                    title,
                    style: titleTextStyle ?? defaultTitleTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
