import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sos/blocs/settings/settings_bloc.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final locales = _getAllLngLoc(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return DropdownButton(
          items: List.generate(
            locales.length,
            (index) => DropdownMenuItem(
              value: locales[index].loc,
              child: Text(locales[index].lan),
            ),
          ),
          onChanged: (value) async {
            await context.setLocale(Locale(value.toString()));
            Phoenix.rebirth(context);
          },
          value: context.locale.toString(),
        );
      },
    );
  }
}

class LngLoc {
  final String loc;
  final String lan;

  LngLoc(this.loc, this.lan);
}

List<LngLoc> _getAllLngLoc(BuildContext context) {
  String getLanguage(BuildContext context, String locale) {
    return LocaleNames.of(context)?.nameOf(locale) ?? '';
  }

  final locales =
      context.findAncestorWidgetOfExactType<MaterialApp>()?.supportedLocales ??
          [];
  final List<LngLoc> lngLocList = locales
      .map(
        (locale) => LngLoc(
          locale.languageCode,
          getLanguage(context, locale.languageCode),
        ),
      )
      .toList();

  return lngLocList;
}
