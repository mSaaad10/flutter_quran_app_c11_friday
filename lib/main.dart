import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c11_friday/providers/quran_details_provider.dart';
import 'package:islami_c11_friday/providers/settings_provider/settings_provider.dart';
import 'package:islami_c11_friday/styles/my_theme_data.dart';
import 'package:islami_c11_friday/ui/home/home_screen.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_details/hadith_details_screen.dart';
import 'package:islami_c11_friday/ui/home/tabs/quran_tab/quran_details/quran_details.dart';
import 'package:islami_c11_friday/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), // singleton instanse
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // English
      ],
      locale: Locale(provider.currentLang),
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeNAme: (_) => HomeScreen(),
        QuranDetailsScreen.routeName: (_) => ChangeNotifierProvider(
            create: (context) => QuranDetailsProvider(),
            child: QuranDetailsScreen()),
        HadithDetailsScreen.routeName: (_) => HadithDetailsScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.currentTheme,
    );
  }
}
