import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sos/blocs/location_utils.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/models/exceptions.dart';

part 'country_detail_event.dart';
part 'country_detail_state.dart';

class CountryDetailBloc extends Bloc<CountryDetailEvent, CountryDetailState> {
  CountryDetailBloc() : super(const CountryDetailState()) {
    on<SetCountryEvent>(_onSetCountry);
    on<CountryFromLocationEvent>(_onCountryFromLocation);
  }

  _onSetCountry(
    SetCountryEvent event,
    Emitter<CountryDetailState> emit,
  ) {
    emit(CountryDetailState(country: event.country));
  }

  _onCountryFromLocation(
    CountryFromLocationEvent event,
    Emitter<CountryDetailState> emit,
  ) async {
    try {
      await checkLocationServiceEnabled();
      await checkLocationPermission();
      final position = await getCurrentPosition();
      final location = await getLocation(position);

      final countryIndex = event.supportedCountries
          .indexWhere((c) => c.isoCode == location.isoCountryCode);

      if (countryIndex == -1) {
        throw AppException(
          type: AppExceptionType.countryNotSupported,
          message: 'Country not supported: ${location.isoCountryCode}',
        );
      }

      emit(state.copyWith(country: event.supportedCountries[countryIndex]));
    } on AppException catch (e) {
      emit(CountryDetailState(appException: e));
    } catch (e) {
      emit(
        CountryDetailState(
          appException: AppException(message: e.toString()),
        ),
      );
    }
  }
}
