import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app_new/Pages/Home/home_page.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  static const String routeName = "onBoarding";
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool isFirstPage = true;
  // Track if the current page is the first one
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .20),
            bodyWidget: buildImage(
                path: AppAssets.introScreen,
                size: size.height * .4,
                text: "Welcome To Islmi App"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(

            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreen1,
                size: size.height * .35,
                text:
                    "Welcome To Islmi App \n \n We Are Very Excited To Have You In Our Community"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreenQuran,
                size: size.height * .35,
                text:
                    "Reading The Quran \n \n Read, and your Lord is the Most Generous"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(

            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreenBearish,
                size: size.height * .35,
                text:
                    "Bearish \n \n Praise the name of your Lord, the Most High"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(


            titleWidget:
                buildImage(path: AppAssets.logo, size: size.height * .15),
            bodyWidget: buildImage(
                path: AppAssets.introScreenRadio,
                size: size.height * .35,
                text:
                    "Holy Quran Radio \n \n You can listen to the Holy Quran Radio through the application for free and easily"),
            decoration: getPageDecoration(),
          ),
        ],
        onDone: () {
          saveOnBoarding();
          goToHome(context);
        },
        onSkip: () => goToHome(context),
        onChange: (index) {
          setState(() {
            isFirstPage = (index == 0);
          });
        },
        // showSkipButton: true,
        showBackButton: !isFirstPage,
        showSkipButton:
            isFirstPage // Track if the current page is the first one
        ,
        animationDuration: 250,
        skip: Text("Skip", style: getTextStyle()),
        next: Text("Next", style: getTextStyle()),
        // backStyle: ButtonStyle(
        //     padding: WidgetStatePropertyAll(EdgeInsets.only(right: 0))),
        back: Text(
          "Back",
          style: getTextStyle(),
        ),
        done: Text("Finish", style: getTextStyle()),
        dotsDecorator: getDotDecoration(),
        globalBackgroundColor: AppColors.blackColor,
        dotsFlex: 3,
        nextFlex: 0,
      ),
    );
  }

  void goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  Widget buildImage(
          {required String path, required double size, String? text}) =>
      text != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(path, height: size),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.bold),
                ),
                // SizedBox(height: 20),
              ],
            )
          : Image.asset(path, height: size);

  PageDecoration getPageDecoration() => const PageDecoration(
        // fullScreen: true,

        titleTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark),
        bodyTextStyle: TextStyle(fontSize: 16, color: AppColors.primaryDark),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.grey,
        activeColor: AppColors.primaryDark,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  TextStyle getTextStyle() => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryDark);

  Future<void> saveOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoarding', true);
  }
}
