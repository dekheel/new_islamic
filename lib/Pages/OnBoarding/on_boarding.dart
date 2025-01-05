import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app_new/Pages/Home/home_page.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  static const String routeName = "OnBoarding";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool isFirstPage = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IntroductionScreen(
      // globalHeader: Image.asset(AppAssets.logo),
      pages: [
        PageViewModel(
            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreen,
                size: size.height * .45,
                text: "Welcome To Islmi App")),
        PageViewModel(
            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreen1,
                size: size.height * .40,
                text:
                    "Welcome To Islmi App\n\nWe Are Very Excited To Have You In Our Community")),
        PageViewModel(
            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreenQuran,
                size: size.height * .40,
                text:
                    "Reading the quran\n\nRead, and your Lord is the Most Generous")),
        PageViewModel(
            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreenBearish,
                size: size.height * .40,
                text:
                    "Bearish\n\nPraise the name of your Lord, the Most High")),
        PageViewModel(
            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreenRadio,
                size: size.height * .40,
                text:
                    "Holy Quran Radio\n\nYou can listen to the Holy Quran Radio through the application for free and easily")),
      ],
      onDone: () {
        goToHome(context);
        saveOnBoarding();
      },
      onChange: (index) {
        setState(() {
          isFirstPage = (index == 0);
        });
      },
      onSkip: () {
        goToHome(context);
        saveOnBoarding();
      },

      skip: Text(
        "Skip",
        style: TextStyle(color: AppColors.primaryDark),
      ),
      next: Text(
        "Next",
        style: TextStyle(color: AppColors.primaryDark),
      ),
      back: Text(
        "Back",
        style: TextStyle(color: AppColors.primaryDark),
      ),
      done: Text(
        "Finish",
        style: TextStyle(color: AppColors.primaryDark),
      ),
      globalBackgroundColor: AppColors.blackColor,
      dotsFlex: 3,
      showBackButton: !isFirstPage,
      showSkipButton: isFirstPage,
      animationDuration: 250,
      dotsDecorator: DotsDecorator(
          color: Colors.grey,
          activeColor: AppColors.primaryDark,
          activeSize: Size(22, 10),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
    );
  }
}

void goToHome(BuildContext context) {
  Navigator.of(context).pushReplacementNamed(HomePage.routeName);
}

Future<void> saveOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(OnBoarding.routeName, true);
}

Widget buildImage({required String path, required double size, String? text}) {
  return text != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              path,
              height: size,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      : Image.asset(
          path,
          height: size,
        );
}
