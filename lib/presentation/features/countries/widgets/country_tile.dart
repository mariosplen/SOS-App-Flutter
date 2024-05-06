import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/theme/app_palette.dart';

class CountryTile extends StatelessWidget {
  const CountryTile({
    super.key,
    required this.country,
    required this.onCountryTap,
  });

  final Country country;
  final void Function(Country) onCountryTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CountryFlag.fromCountryCode(
        country.isoCode,
        width: 33,
        height: 25,
      ),
      title: Text(
        country.name,
        style: _titleStyle,
      ),
      subtitle: Text(
        country.nativeName,
        style: _subtitleStyle,
      ),
      trailing: IconButton(
        icon: country.isFavorite
            ? const Icon(
                Icons.star,
                color: AppPalette.gold,
                size: 28,
              )
            : const Icon(
                Icons.star_outline_rounded,
                color: AppPalette.grey,
                size: 28,
              ),
        onPressed: () => onCountryTap(country),
      ),
      onTap: () => onCountryTap(country),
    );
  }
}

TextStyle _titleStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppPalette.black,
);

TextStyle _subtitleStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  fontSize: 14,
  fontWeight: FontWeight.w300,
  color: AppPalette.grey,
);
