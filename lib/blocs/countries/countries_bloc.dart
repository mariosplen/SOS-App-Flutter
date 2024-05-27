import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/services/services.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  SharedPreferences? prefs;
  CountriesBloc() : super(const CountriesState()) {
    on<LoadCountries>(_onLoadCountries);
    on<Search>(
      _onSearch,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }

  _onLoadCountries(
    LoadCountries event,
    Emitter<CountriesState> emit,
  ) async {
    prefs = await SharedPreferences.getInstance();
    final countries = await ApiService().getCountries();
    emit(state.copyWith(countries: countries));
  }

  _onSearch(
    Search event,
    Emitter<CountriesState> emit,
  ) {
    final query = event.query.trim().toLowerCase();
    if (query == state.query) return;
    emit(state.copyWith(query: query));
  }

  List<Country> getShownCountries() {
    final countries = state.countries
        .where(
          (country) =>
              country.name.toLowerCase().contains(state.query) ||
              country.nativeName.toLowerCase().contains(state.query),
        )
        .toList();

    //set the favorite countries

    for (var country in countries) {
      country.isFavorite = prefs?.getBool(country.isoCode) ?? false;
    }

    // sort by liked and name
    countries.sort((a, b) {
      if (a.isFavorite && !b.isFavorite) {
        return -1;
      } else if (!a.isFavorite && b.isFavorite) {
        return 1;
      } else {
        return a.name.compareTo(b.name);
      }
    });
    return countries;
  }
}
