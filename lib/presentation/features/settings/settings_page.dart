import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/settings/settings_bloc.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';
import 'package:sos/presentation/features/settings/widgets/setting_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final bloc = context.read<SettingsBloc>();
        final String currentTheme = bloc.getThemeMode();
        final String? currentLang =
            LocaleNames.of(context)?.nameOf(context.locale.toString());
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                SettingTile(
                  icon: const Icon(Icons.color_lens),
                  title: 'Theme',
                  selectedValue: currentTheme,
                  onTap: () => context.push("/settings/theme"),
                ),
                SettingTile(
                  icon: const Icon(Icons.language),
                  title: LocaleKeys.language.tr(),
                  selectedValue: currentLang,
                  onTap: () => context.push("/settings/language"),
                ),
                SettingTile(
                  icon: const Icon(Icons.privacy_tip),
                  title: 'Terms and Conditions',
                  onTap: () => context.push("/settings/terms"),
                ),
                SettingTile(
                  icon: const Icon(Icons.info),
                  title: 'About',
                  onTap: () => context.push("/settings/about"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
