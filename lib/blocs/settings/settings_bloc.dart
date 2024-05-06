import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<ChangeThemeMode>(_onChangeThemeMode);
    on<ChangeTerms>(_onChangeTerms);
    on<Init>(_onInit);
  }

  late final SharedPreferences? prefs;

  _onInit(Init event, Emitter<SettingsState> emit) async {
    prefs = await SharedPreferences.getInstance();

    emit(
      state.copyWith(
        isLoaded: true,
        themeMode: prefs?.getInt('themeMode') ?? 0,
        termsAccepted: prefs?.getBool('termsAccepted') ?? false,
      ),
    );
  }

  _onChangeThemeMode(ChangeThemeMode event, Emitter<SettingsState> emit) async {
    prefs?.setInt('themeMode', event.themeMode);
    emit(state.copyWith(themeMode: event.themeMode));
  }

  _onChangeTerms(ChangeTerms event, Emitter<SettingsState> emit) async {
    prefs?.setBool('termsAccepted', event.termsAccepted);
    emit(state.copyWith(termsAccepted: event.termsAccepted));
  }

  String getThemeMode() {
    switch (state.themeMode) {
      case 0:
        return 'System';
      case 1:
        return 'Light';
      case 2:
        return 'Dark';
      default:
        return 'System';
    }
  }
}
