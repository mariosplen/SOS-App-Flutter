import 'package:flutter/material.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/theme/app_palette.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 7),
              color: AppPalette.black,
              height: 1,
            ),
          ),
          Text(
            "OR",
            style: orSeparatorTextStyle,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 7),
              color: AppPalette.black,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle orSeparatorTextStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  color: AppPalette.grey,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
