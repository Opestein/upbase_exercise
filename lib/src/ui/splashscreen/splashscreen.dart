import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:upbaseexercise/src/mixin/splash_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upbaseexercise/src/utils/assets.dart';

class SplashPage extends StatelessWidget {
  final SharedPreferences preferences;
  final Dio dio;

  SplashPage(
    this.preferences,
    this.dio,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            width: 1,
            color: Color.fromARGB(255, 151, 151, 151),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 53,
              child: Image.asset(
                "assets/images/logo-v3-3.png",
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin, SplashHelper {
  AnimationController moMoneyTextAnimationController;
  AnimationController togetherLetSMakeTextAnimationController;

  AnimationController _fadeController;

  Animation animation;

  @override
  void initState() {
    super.initState();

    this.moMoneyTextAnimationController =
        AnimationController(duration: Duration(milliseconds: 2000), vsync: this)
          ..forward();
    this.togetherLetSMakeTextAnimationController =
        AnimationController(duration: Duration(milliseconds: 2000), vsync: this)
          ..forward();

    this._fadeController =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..forward();
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeController);

    _fadeController.forward();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      checkFirstScreen(
        context,
      );
    });
  }

  @override
  void dispose() {
    this.moMoneyTextAnimationController.dispose();
    this.togetherLetSMakeTextAnimationController.dispose();

    super.dispose();
  }

  void startAnimationOne() => this.moMoneyTextAnimationController.forward();

  void startAnimationTwo() =>
      this.togetherLetSMakeTextAnimationController.forward();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            width: 1,
            color: Color.fromARGB(255, 151, 151, 151),
          ),
        ),
        child: FadeTransition(
          opacity: animation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 96,
                  height: 53,
                  child: Image.asset(
                    Assets.app_icon,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
