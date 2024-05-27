/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $LibGen {
  const $LibGen();

  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  $LibAssetsDataGen get data => const $LibAssetsDataGen();
  $LibAssetsIconsGen get icons => const $LibAssetsIconsGen();
  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();
  $LibAssetsTranslationsGen get translations =>
      const $LibAssetsTranslationsGen();
}

class $LibAssetsDataGen {
  const $LibAssetsDataGen();

  /// File path: lib/assets/data/countries.json
  String get countries => 'lib/assets/data/countries.json';

  /// List of all assets
  List<String> get values => [countries];
}

class $LibAssetsIconsGen {
  const $LibAssetsIconsGen();

  /// File path: lib/assets/icons/marker.svg
  SvgGenImage get marker => const SvgGenImage('lib/assets/icons/marker.svg');

  /// List of all assets
  List<SvgGenImage> get values => [marker];
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  /// File path: lib/assets/images/ambulance.png
  AssetGenImage get ambulance =>
      const AssetGenImage('lib/assets/images/ambulance.png');

  /// File path: lib/assets/images/bg_top.png
  AssetGenImage get bgTop =>
      const AssetGenImage('lib/assets/images/bg_top.png');

  /// File path: lib/assets/images/call.png
  AssetGenImage get call => const AssetGenImage('lib/assets/images/call.png');

  /// File path: lib/assets/images/country_details.png
  AssetGenImage get countryDetails =>
      const AssetGenImage('lib/assets/images/country_details.png');

  /// File path: lib/assets/images/country_details2.png
  AssetGenImage get countryDetails2 =>
      const AssetGenImage('lib/assets/images/country_details2.png');

  /// File path: lib/assets/images/fire.png
  AssetGenImage get fire => const AssetGenImage('lib/assets/images/fire.png');

  /// File path: lib/assets/images/location.png
  AssetGenImage get location =>
      const AssetGenImage('lib/assets/images/location.png');

  /// File path: lib/assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('lib/assets/images/logo.png');

  /// File path: lib/assets/images/police.png
  AssetGenImage get police =>
      const AssetGenImage('lib/assets/images/police.png');

  /// File path: lib/assets/images/traffic.png
  AssetGenImage get traffic =>
      const AssetGenImage('lib/assets/images/traffic.png');

  /// File path: lib/assets/images/wave.png
  AssetGenImage get wave => const AssetGenImage('lib/assets/images/wave.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        ambulance,
        bgTop,
        call,
        countryDetails,
        countryDetails2,
        fire,
        location,
        logo,
        police,
        traffic,
        wave
      ];
}

class $LibAssetsTranslationsGen {
  const $LibAssetsTranslationsGen();

  /// File path: lib/assets/translations/el.json
  String get el => 'lib/assets/translations/el.json';

  /// File path: lib/assets/translations/en.json
  String get en => 'lib/assets/translations/en.json';

  /// File path: lib/assets/translations/ru.json
  String get ru => 'lib/assets/translations/ru.json';

  /// List of all assets
  List<String> get values => [el, en, ru];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
