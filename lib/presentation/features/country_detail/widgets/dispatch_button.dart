import 'package:flutter/material.dart';

class DispatchButton extends StatelessWidget {
  const DispatchButton(
    this.numbers,
    this.buttonText, {
    required this.onPressed,
    super.key,
  });

  final List<String> numbers;
  final TextStyle buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 255, 139, 131),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  numbers.length,
                  (index) => Text(
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
