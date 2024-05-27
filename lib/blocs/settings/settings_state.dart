part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.themeMode = 0,
    this.termsAccepted = false,
    this.isLoaded = false,
    this.language = 'en',
  });

  final int themeMode;
  final bool termsAccepted;
  final bool isLoaded;
  final String language;

  SettingsState copyWith({
    int? themeMode,
    String? locale,
    bool? termsAccepted,
    bool? isLoaded,
    String? language,
  }) =>
      SettingsState(
        themeMode: themeMode ?? this.themeMode,
        termsAccepted: termsAccepted ?? this.termsAccepted,
        isLoaded: isLoaded ?? this.isLoaded,
        language: language ?? this.language,
      );

  @override
  List<Object> get props => [themeMode, termsAccepted, isLoaded, language];
}
