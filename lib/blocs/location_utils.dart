import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sos/models/exceptions.dart';

checkLocationServiceEnabled() async {
  final locationEnabled = await Geolocator.isLocationServiceEnabled();
  if (!locationEnabled) {
    throw AppException(
      type: AppExceptionType.locationDisabled,
      message: 'Location services are disabled.',
    );
  }
}

checkLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.unableToDetermine) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.deniedForever) {
    throw AppException(
      type: AppExceptionType.locationDeniedForever,
      message: 'Location permission is denied forever.',
    );
  }
  if (permission == LocationPermission.denied) {
    throw AppException(
      type: AppExceptionType.locationDenied,
      message: 'Location permission is denied.',
    );
  }
}

Future<Position> getCurrentPosition() async {
  try {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 8),
      forceAndroidLocationManager: true,
    );
    return position;
  } catch (e) {
    throw AppException(
      type: AppExceptionType.geoLocatorError,
      message: e.toString(),
    );
  }
}

Future<Placemark> getLocation(Position pos) async {
  try {
    final location = await placemarkFromCoordinates(
      pos.latitude,
      pos.longitude,
    );
    return location.first;
  } on PlatformException catch (e) {
    throw AppException(
      type: AppExceptionType.geoCodingLimitError,
      message: e.toString(),
    );
  } catch (e) {
    throw AppException(
      type: AppExceptionType.geoCodingError,
      message: e.toString(),
    );
  }
}
