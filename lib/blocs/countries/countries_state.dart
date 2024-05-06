part of 'countries_bloc.dart';

class CountriesState extends Equatable {
  final List<Country> countries;
  final String query;

  const CountriesState({
    this.countries = const [],
    this.query = '',
  });

  CountriesState copyWith({
    List<Country>? countries,
    String? query,
  }) =>
      CountriesState(
        countries: countries ?? this.countries,
        query: query ?? this.query,
      );

  @override
  List<Object> get props => [countries, query];
}
