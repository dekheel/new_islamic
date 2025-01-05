import 'package:flutter/material.dart';
import 'package:islami_app_new/Tabs/Hadeth/hadeth_tab.dart';
import 'package:islami_app_new/Tabs/Quran/quran_tab.dart';
import 'package:islami_app_new/Tabs/Radio/radio_tab.dart';
import 'package:islami_app_new/Tabs/Sebha/sebha_tab.dart';
import 'package:islami_app_new/Tabs/Timer/timer_tab.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedBottomNavBarIndex = 0;

  List<Widget> tabsBody = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    const RadioTab(),
    const TimerTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(_backGroundBuilder(),
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Scaffold(
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryDark),
            child: BottomNavigationBar(
              currentIndex: selectedBottomNavBarIndex,
              onTap: (index) {
                selectedBottomNavBarIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    label: "quran",
                    icon: _bottomNavBarBuilder(0, AppAssets.quranIcon)),
                BottomNavigationBarItem(
                    label: "Hadeth",
                    icon: _bottomNavBarBuilder(1, AppAssets.hadethIcon)),
                BottomNavigationBarItem(
                    label: "Sebha",
                    icon: _bottomNavBarBuilder(2, AppAssets.sebhaIcon)),
                BottomNavigationBarItem(
                    label: "Radio",
                    icon: _bottomNavBarBuilder(3, AppAssets.radioIcon)),
                BottomNavigationBarItem(
                    label: "Time",
                    icon: _bottomNavBarBuilder(4, AppAssets.timeIcon)),
              ],
            ),
          ),
          body: tabsBody[selectedBottomNavBarIndex],
        )
      ],
    );
  }

  Widget _bottomNavBarBuilder(int index, String imagePath) {
    return selectedBottomNavBarIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.itemBackgroundColor),
            child: ImageIcon(
              AssetImage(imagePath),
            ))
        : ImageIcon(
            AssetImage(imagePath),
          );
  }

  String _backGroundBuilder() {
    switch (selectedBottomNavBarIndex) {
      case 0:
        return AppAssets.quranBackground;
      case 1:
        return AppAssets.hadethBackground;
      case 2:
        return AppAssets.sebhaBackground;
      case 3:
        return AppAssets.radioBackground;
      case 4:
        return AppAssets.timerBackground;
      default:
        return AppAssets.quranBackground;
    }
  }
}
