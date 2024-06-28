/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_arrow_down.svg
  String get icArrowDown => 'assets/images/ic_arrow_down.svg';

  /// File path: assets/images/ic_arrow_more.svg
  String get icArrowMore => 'assets/images/ic_arrow_more.svg';

  /// File path: assets/images/ic_cart.svg
  String get icCart => 'assets/images/ic_cart.svg';

  /// File path: assets/images/ic_clock.svg
  String get icClock => 'assets/images/ic_clock.svg';

  /// File path: assets/images/ic_discount.svg
  String get icDiscount => 'assets/images/ic_discount.svg';

  /// File path: assets/images/ic_favorite.svg
  String get icFavorite => 'assets/images/ic_favorite.svg';

  /// File path: assets/images/ic_favorite_fill.svg
  String get icFavoriteFill => 'assets/images/ic_favorite_fill.svg';

  /// File path: assets/images/ic_home.svg
  String get icHome => 'assets/images/ic_home.svg';

  /// File path: assets/images/ic_orders.svg
  String get icOrders => 'assets/images/ic_orders.svg';

  /// File path: assets/images/ic_profile.svg
  String get icProfile => 'assets/images/ic_profile.svg';

  /// File path: assets/images/ic_search.svg
  String get icSearch => 'assets/images/ic_search.svg';

  /// File path: assets/images/ic_star.svg
  String get icStar => 'assets/images/ic_star.svg';

  /// File path: assets/images/ic_wallet.svg
  String get icWallet => 'assets/images/ic_wallet.svg';

  /// File path: assets/images/splash_full_image.png
  AssetGenImage get splashFullImage =>
      const AssetGenImage('assets/images/splash_full_image.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// File path: assets/images/test_banner.png
  AssetGenImage get testBanner =>
      const AssetGenImage('assets/images/test_banner.png');

  /// List of all assets
  List<dynamic> get values => [
        icArrowDown,
        icArrowMore,
        icCart,
        icClock,
        icDiscount,
        icFavorite,
        icFavoriteFill,
        icHome,
        icOrders,
        icProfile,
        icSearch,
        icStar,
        icWallet,
        splashFullImage,
        splashLogo,
        testBanner
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
