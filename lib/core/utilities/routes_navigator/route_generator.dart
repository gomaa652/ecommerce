import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';
import 'package:yalla_client/features/nav/presentation/pages/nav_page.dart';
import '../../../features/splash_screen.dart';
import '../../../translations/locale_keys.g.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      case AppRoute.splashPage:
        return _screenInit(const SplashScreen(), settings);
      case AppRoute.navPage:
        return _screenInit(const NavPage(), settings);
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute<dynamic> _screenInit(
      Widget screen, RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
        builder: (_) => screen, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AllColors.white,
          title: Text(LocaleKeys.error.tr()),
        ),
        body: Center(
          child: Text(LocaleKeys.someThingWentWrong.tr()),
        ),
      );
    });
  }
}
