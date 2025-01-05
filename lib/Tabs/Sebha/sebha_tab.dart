import 'dart:math';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_theme.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double degrees = 1;
  int counter = 0;
  int index = 0;

  List<String> tasbeehWords = ["سبحان الله", "الحمد لله", "الله اكبر"];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.logo,
            height: screenSize.height * .20,
          ),
          Center(
            child: Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: AppTheme.darkTheme.textTheme.headlineLarge
                    ?.copyWith(fontSize: 26)),
          ),
          Center(
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                top: -screenSize.height * .36,
                left: screenSize.width * .15,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  AppAssets.sebhaHead,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 90),
                child: InkWell(
                  onTap: _handleTasbeeh,
                  child: Transform.rotate(
                    angle: degrees,
                    child: Image.asset(
                      AppAssets.sebhaBody,
                      height: screenSize.height * .40,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenSize.height * .27,
                child: Column(
                  children: [
                    Text(tasbeehWords[index],
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 24)),
                    SizedBox(
                      height: screenSize.height * .07,
                    ),
                    Text(
                      "$counter",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 24),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  // Handles tasbeeh counting and rotation logic
  void _handleTasbeeh() {
    setState(() {
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % tasbeehWords.length;
      } else {
        counter++;
      }
      degrees += 1;
    });
  }
}
