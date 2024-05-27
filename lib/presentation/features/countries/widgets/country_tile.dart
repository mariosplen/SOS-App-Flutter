import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/theme/app_palette.dart';

class CountryTile extends StatefulWidget {
  const CountryTile({
    super.key,
    required this.country,
    required this.onCountryTap,
  });

  final Country country;
  final void Function(Country) onCountryTap;

  @override
  State<CountryTile> createState() => _CountryTileState();
}

class _CountryTileState extends State<CountryTile> {
  @override
  Widget build(BuildContext context) {
    var isTapped = widget.country.isFavorite;
    return ListTile(
      leading: CountryFlag.fromCountryCode(
        widget.country.isoCode,
        width: 33,
        height: 25,
      ),
      title: Text(
        widget.country.name,
        style: _titleStyle,
      ),
      subtitle: Text(
        widget.country.nativeName,
        style: _subtitleStyle,
      ),
      trailing: IconButton(
        icon: isTapped
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
        onPressed: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool(
            widget.country.isoCode,
            !widget.country.isFavorite,
          );
          setState(() {
            widget.country.isFavorite = !widget.country.isFavorite;
          });
        },
      ),
      onTap: () => widget.onCountryTap(widget.country),
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
