import 'package:flutter/material.dart';
import 'package:islami_app_new/Pages/Hadeth/hadeth_details_screen.dart';
import 'package:islami_app_new/Pages/Quran/sura_details_screen.dart';
import 'package:islami_app_new/core/app_theme.dart';
import 'package:islami_app_new/Pages/Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
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
