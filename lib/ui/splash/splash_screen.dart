import 'package:flutter/material.dart';
import 'package:islami_c11_friday/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeNAme);
      },
    );
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.jpg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
