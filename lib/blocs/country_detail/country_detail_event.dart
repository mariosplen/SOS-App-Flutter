part of 'country_detail_bloc.dart';

sealed class CountryDetailEvent extends Equatable {
  const CountryDetailEvent();

  @override
  List<Object> get props => [];
}

class SetCountryEvent extends CountryDetailEvent {
  final Country country;

  const SetCountryEvent(this.country);

  @override
  List<Object> get props => [country];
}

class CountryFromLocationEvent extends CountryDetailEvent {
  final List<Country> supportedCountries;
  const CountryFromLocationEvent(this.supportedCountries);
}
