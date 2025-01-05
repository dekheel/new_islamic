import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_new/Pages/Hadeth/hadeth_details_screen.dart';
import 'package:islami_app_new/Pages/OnBoarding/on_boarding.dart';
import 'package:islami_app_new/Pages/Quran/sura_details_screen.dart';
import 'package:islami_app_new/core/app_theme.dart';
import 'package:islami_app_new/Pages/Home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool? showOnBoarding = prefs.getBool(OnBoarding.routeName);
  runApp(MyApp(
    showOnBoarding: showOnBoarding,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.showOnBoarding});
  final bool? showOnBoarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic',
      debugShowCheckedModeBanner: false,
      initialRoute:
          showOnBoarding == true ? HomePage.routeName : OnBoarding.routeName,
      routes: {
        OnBoarding.routeName: (context) => OnBoarding(),
        HomePage.routeName: (context) => const HomePage(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.darkTheme,
    );
  }
}
