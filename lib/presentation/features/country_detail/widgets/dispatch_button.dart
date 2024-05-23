import 'package:flutter/material.dart';
import 'package:sos/presentation/shared/re_text.dart';

class DispatchButton extends StatelessWidget {
  // ignore: use_super_parameters
  const DispatchButton(
    this.numbers,
    this.buttonText, {
    Key? key,
  }) : super(key: key);

  final List<String> numbers;
  final TextStyle buttonText;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 255, 139, 131)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  numbers.length,
                  (index) => ReText(
                    numbers[index],
                    style: buttonText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
