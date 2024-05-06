part of 'country_detail_bloc.dart';

class CountryDetailState extends Equatable {
  const CountryDetailState({this.country, this.appException});
  final Country? country;
  final AppException? appException;

  CountryDetailState copyWith({
    Country? country,
    AppException? appException,
  }) {
    return CountryDetailState(
      country: country ?? this.country,
      appException: appException ?? this.appException,
    );
  }

  @override
  List<Object?> get props => [country, appException];
}
