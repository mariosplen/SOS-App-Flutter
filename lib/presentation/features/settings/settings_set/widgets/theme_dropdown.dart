import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sos/blocs/settings/settings_bloc.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';

class ThemeDropdown extends StatelessWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final bloc = context.read<SettingsBloc>();
        return DropdownButton(
          value: bloc.getThemeMode(),
          onChanged: (String? value) {
            bloc.add(ChangeThemeMode(bloc.themeFromString(value!)));
          },
          items: [
            DropdownMenuItem(
              value: 'System',
              child: Text(LocaleKeys.system.tr()),
            ),
            DropdownMenuItem(
              value: 'Light',
              child: Text(LocaleKeys.light.tr()),
            ),
            DropdownMenuItem(
              value: 'Dark',
              child: Text(LocaleKeys.dark.tr()),
            ),
          ],
        );
      },
    );
  }
}
