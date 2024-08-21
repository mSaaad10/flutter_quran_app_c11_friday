import 'package:flutter/material.dart';
import 'package:islami_c11_friday/ui/home/home_screen.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_c11_friday/ui/home/tabs/quran_tab/quran_details/quran_details.dart';
import 'package:islami_c11_friday/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeNAme: (_) => HomeScreen(),
        QuranDetailsScreen.routeName: (_) => QuranDetailsScreen(),
        HadethDetailsScreen.routeName:(_) => HadethDetailsScreen(),
      },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFFB7935F),
            primary: Color(0xFFB7935F),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.transparent,
          canvasColor: Color(0xFFB7935F),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              selectedIconTheme: IconThemeData(
                size: 36,
              ),
              unselectedIconTheme: IconThemeData(
                size: 24,
              ),
              showSelectedLabels: true,
              showUnselectedLabels: true)),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF141A2E),
            primary: Color(0xFF141A2E),
          ),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              )),
          scaffoldBackgroundColor: Colors.transparent,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.yellow,
              unselectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true)),
      themeMode: ThemeMode.light,
    );
  }
}
