part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({
    this.address,
    this.appException,
    this.location,
    this.copied = false,
  });

  final AppException? appException;
  final Placemark? address;
  final LatLng? location;
  final bool copied;

  MapState copyWith({
    AppException? appException,
    Placemark? address,
    LatLng? location,
    bool? copied,
  }) {
    return MapState(
      address: address ?? this.address,
      appException: appException ?? this.appException,
      location: location ?? this.location,
      copied: copied ?? this.copied,
    );
  }

  @override
  List<Object?> get props => [address, appException, location, copied];
}
