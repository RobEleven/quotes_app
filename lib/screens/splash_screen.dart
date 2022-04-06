import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';
import 'package:quotesapp/screens/app_main_screen.dart';

class AppSplashScreen extends StatefulWidget {
  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    animation = ColorTween(begin: Colors.grey.shade800, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {
        animation.value;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SplashScreen(
          useLoader: false,
          seconds: 6,
          backgroundColor: animation.value,
          image: Image.asset('images/Q.png'),
          photoSize: 100,
          navigateAfterSeconds: HomePage(),
        ),
      ),
    );
  }
}
