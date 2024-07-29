import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo/_base/widgets/base_stateful_widget.dart';
import 'package:ringo/res/assets_paths.dart';
import 'package:ringo/ui/screens/login/login_screen.dart';
import 'package:ringo/util/ui/screen_controller.dart';

class SplashScreen extends BaseStatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    /// to make full screen
    enterFullScreen();

    /// to start time to switch to another screen
    _startTime();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssPaths.logoFull,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  void _startTime() async {
    var _duration = const Duration(milliseconds: 1500);
    Timer(_duration, _goToNextScreen);
  }

  Future _goToNextScreen() async {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }
}
