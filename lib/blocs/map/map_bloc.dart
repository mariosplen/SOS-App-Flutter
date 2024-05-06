import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sos/blocs/location_utils.dart';
import 'package:sos/models/exceptions.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<GetLocation>(_onGetLocation);
    on<SharePressed>(_onSharePressed);
    on<CopyPressed>(_onCopyPressed);
  }

  _onGetLocation(
    GetLocation event,
    Emitter<MapState> emit,
  ) async {
    try {
      await checkLocationServiceEnabled();
      await checkLocationPermission();
      final position = await getCurrentPosition();
      final location = await getLocation(position);

      emit(
        state.copyWith(
          location: LatLng(position.latitude, position.longitude),
          address: location,
        ),
      );
    } on AppException catch (e) {
      emit(MapState(appException: e, address: null, location: null));
    } catch (e) {
      emit(
        MapState(
          appException: AppException(message: e.toString()),
          address: null,
          location: null,
        ),
      );
    }
  }

  _onSharePressed(
    SharePressed event,
    Emitter<MapState> emit,
  ) async {
    Share.share(
      'https://www.google.com/maps/search/?api=1&query=${state.location?.latitude},${state.location?.longitude}',
    );
  }

  _onCopyPressed(
    CopyPressed event,
    Emitter<MapState> emit,
  ) async {
    Clipboard.setData(ClipboardData(text: event.copyValue));
    emit(state.copyWith(copied: true));
    emit(state.copyWith(copied: false));
  }
}
