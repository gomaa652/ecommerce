import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';
import 'package:yalla_client/core/utilities/routes_navigator/navigator.dart';
import 'package:yalla_client/features/nav/presentation/pages/nav_page.dart';
import 'package:yalla_client/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  changeScreen() {
    Timer(const Duration(seconds: 2), () async {
      pushPageWithAnimationTransition(context, const NavPage(),
          _buildSplashImage(), const Duration(seconds: 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSplashImage();
  }

  Widget _buildSplashImage() {
    return Scaffold(
      backgroundColor: AllColors.yellow,
      body: Column(
        children: [
          const Spacer(),
          Image.asset(Assets.images.splashFullImage.path),
        ],
      ),
    );
  }
}
