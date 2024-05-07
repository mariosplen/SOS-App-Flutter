import 'package:flutter/material.dart';

class ThemeDropdown extends StatelessWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: 'Light',
      onChanged: (String? value) {},
      items: const [
        DropdownMenuItem(
          value: 'System',
          child: Text('System'),
        ),
        DropdownMenuItem(
          value: 'Light',
          child: Text('Light'),
        ),
        DropdownMenuItem(
          value: 'Dark',
          child: Text('Dark'),
        ),
      ],
    );
  }
}
