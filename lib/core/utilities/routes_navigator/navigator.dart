import 'package:flutter/material.dart';

void pushPage(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}

void pushPageWithAnimationTransition(BuildContext context, Widget newWidget,
    Widget oldWidget, Duration duration) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => newWidget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define the animations for both pages
        var oldPageAnimation = Tween(begin: Offset.zero, end: Offset(0.0, -1.0))
            .animate(animation); // Slide up animation for old page
        var newPageAnimation = Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
            .animate(animation); // Slide in animation for new page
        // Apply the animations to the pages
        return Stack(
          children: <Widget>[
            SlideTransition(
              position: oldPageAnimation,
              child: oldWidget, // Old page
            ),
            SlideTransition(
              position: newPageAnimation,
              child: child, // New page
            ),
          ],
        );
      },
      transitionDuration: duration,
    ),
  );
}

void popAllAndPushPage(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
    (Route<dynamic> route) => false,
  );
}

void popAndPushName(BuildContext context, String route, {dynamic arguments}) {
  Navigator.of(context).popAndPushNamed(route, arguments: arguments);
}

void popAllAndPushName(
  BuildContext context,
  String widget, {
  RoutePredicate? condition,
  Object? arguments,
}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
      widget, condition ?? (Route<dynamic> route) => false,
      arguments: arguments);
}

void popScreen(BuildContext context, {int? numberOfPages}) {
  return Navigator.pop(
    context,
    numberOfPages,
  );
}

void popScreens(BuildContext context, int numberOfPages) {
  int count = 0;
  return Navigator.of(context).popUntil((_) => count++ >= numberOfPages);
}

void popWithArguments(BuildContext context, dynamic args) {
  return Navigator.pop(context, args);
}

void popUntil(BuildContext context, String route) {
  Navigator.popUntil(context, ModalRoute.withName(route));
}

Future<dynamic> pushName(BuildContext context, String route,
    {dynamic arguments}) {
  return Navigator.of(context).pushNamed(route, arguments: arguments);
}

Future<dynamic> pushNameForResult(BuildContext context, String route) {
  return Navigator.of(context).pushNamed(route);
}

Future<dynamic> pushNameWithArgumentsForResult(
    BuildContext context, String route, dynamic argument) {
  return Navigator.of(context).pushNamed(route, arguments: argument);
}

void pushNameWithArguments(
    BuildContext context, String route, dynamic argument) {
  Navigator.of(context).pushNamed(route, arguments: argument);
}

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
  FocusScope.of(context).requestFocus(FocusNode());
}

void pushNameReplacement(BuildContext context, String route,
    {dynamic arguments}) {
  Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
}

void pushPageRoute<T>(BuildContext context, Route<T> route) {
  Navigator.of(context).push(route);
}
