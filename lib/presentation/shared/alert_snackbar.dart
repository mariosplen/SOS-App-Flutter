import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';
import 'package:sos/models/exceptions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showAlertMessageSnackBar(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: message,
      maxLines: 8,
    ),
  );
}

void showAlertSnackbar(BuildContext context, AppExceptionType type) {
  String getDisplayedErrorMessage(AppExceptionType type) {
    switch (type) {
      case AppExceptionType.unknown:
        return LocaleKeys.error_unknown.tr();
      case AppExceptionType.locationDisabled:
        return LocaleKeys.error_location_disabled.tr();
      case AppExceptionType.locationDeniedForever:
        return LocaleKeys.error_location_denied_forever.tr();
      case AppExceptionType.locationDenied:
        return LocaleKeys.error_location_denied.tr();
      case AppExceptionType.geoLocatorError:
        return LocaleKeys.error_geo_locator.tr();
      case AppExceptionType.geoCodingError:
        return LocaleKeys.error_geo_coding.tr();
      case AppExceptionType.geoCodingLimitError:
        return LocaleKeys.error_geo_coding_limit.tr();
      case AppExceptionType.countryNotSupported:
        return LocaleKeys.error_country_not_supported.tr();
    }
  }

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
