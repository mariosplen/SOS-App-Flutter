part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.themeMode = 0,
    this.termsAccepted = false,
    this.isLoaded = false,
  });

  final int themeMode;
  final bool termsAccepted;
  final bool isLoaded;

  SettingsState copyWith({
    int? themeMode,
    String? locale,
    bool? termsAccepted,
    bool? isLoaded,
  }) =>
      SettingsState(
        themeMode: themeMode ?? this.themeMode,
        termsAccepted: termsAccepted ?? this.termsAccepted,
        isLoaded: isLoaded ?? this.isLoaded,
      );

  @override
  List<Object> get props => [themeMode, termsAccepted, isLoaded];
}
