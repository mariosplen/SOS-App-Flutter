import 'package:flutter/material.dart';
import 'package:sos/presentation/shared/re_text.dart';

class DispatchButton extends StatelessWidget {
  const DispatchButton(
    this.numbers, {
    super.key,
  });
  final List<String> numbers;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                numbers.length,
                (index) => ReText(numbers[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
