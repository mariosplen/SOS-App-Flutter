import 'package:flutter/material.dart';
import 'package:sos/models/exceptions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showAlertMessageSnackBar(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(message: message),
  );
}

void showAlertSnackbar(BuildContext context, AppExceptionType type) {
  if (type == AppExceptionType.unknown ||
      type == AppExceptionType.geoLocatorError ||
      type == AppExceptionType.geoCodingError ||
      type == AppExceptionType.geoCodingLimitError ||
      type == AppExceptionType.countryNotSupported ||
      type == AppExceptionType.locationDeniedForever) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: getDisplayedErrorMessage(type)),
    );
  }
  if (type == AppExceptionType.locationDisabled ||
      type == AppExceptionType.locationDenied) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: getDisplayedErrorMessage(type)),
    );
  }
}

String getDisplayedErrorMessage(AppExceptionType type) {
  switch (type) {
    case AppExceptionType.unknown:
      return 'An unknown error occurred, please try again later.';
    case AppExceptionType.locationDisabled:
      return 'Location services are disabled, please enable location to use this feature.';
    case AppExceptionType.locationDeniedForever:
      return 'Location permissions are denied permanently, please allow location permissions in app permissions settings.';
    case AppExceptionType.locationDenied:
      return 'Location permissions are denied, please allow location permissions to use this feature.';
    case AppExceptionType.geoLocatorError:
      return 'An error occurred while getting location, please try again later.';
    case AppExceptionType.geoCodingError:
      return 'An error occurred while getting address, please try again later.';
    case AppExceptionType.geoCodingLimitError:
      return 'You have reached the limit of address requests, please try again later.';
    case AppExceptionType.countryNotSupported:
      return 'We are sorry, but this country is not supported.';
  }
}
