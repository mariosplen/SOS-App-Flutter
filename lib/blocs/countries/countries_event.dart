part of 'countries_bloc.dart';

abstract class CountriesEvent extends Equatable {
  const CountriesEvent();

  @override
  List<Object?> get props => [];
}

class LoadCountries extends CountriesEvent {
  const LoadCountries();
}

class Search extends CountriesEvent {
  final String query;

  const Search(this.query);

  @override
  List<Object?> get props => [query];
}

class FindCountryByLocation extends CountriesEvent {
  const FindCountryByLocation();
}
