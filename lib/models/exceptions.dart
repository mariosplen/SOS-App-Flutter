class AppException implements Exception {
  final AppExceptionType type;
  final String message;

  AppException({
    required this.message,
    this.type = AppExceptionType.unknown,
  });

  @override
  String toString() {
    return 'AppException(type: $type, message: $message)';
  }
}

enum AppExceptionType {
  unknown,
  locationDisabled,
  locationDeniedForever,
  locationDenied,
  geoLocatorError,
  geoCodingError,
  geoCodingLimitError,
  countryNotSupported,
}
