import 'package:flutter/material.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/theme/app_palette.dart';

class UseLocationButton extends StatelessWidget {
  const UseLocationButton({
    super.key,
    required this.countries,
    required this.onTap,
  });

  final List<Country> countries;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.location_on,
        color: AppPalette.white,
      ),
      onPressed: onTap,
      style: _buttonStyle,
      label: Text(
        'USE MY LOCATION',
        style: _titleStyle,
      ),
    );
  }
}

TextStyle _titleStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppPalette.white,
);

ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(double.infinity, 50),
  padding: const EdgeInsets.symmetric(horizontal: 17),
  backgroundColor: AppPalette.primary,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);
