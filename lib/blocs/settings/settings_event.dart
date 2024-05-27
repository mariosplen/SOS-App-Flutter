part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class Init extends SettingsEvent {
  const Init();
}

class ChangeThemeMode extends SettingsEvent {
  const ChangeThemeMode(this.themeMode);

  final int themeMode;

  @override
  List<Object> get props => [themeMode];
}

class ChangeTerms extends SettingsEvent {
  const ChangeTerms(this.termsAccepted);

  final bool termsAccepted;

  @override
  List<Object> get props => [termsAccepted];
}

class ChangeLanguage extends SettingsEvent {
  const ChangeLanguage(this.language);

  final String language;

  @override
  List<Object> get props => [language];
}
