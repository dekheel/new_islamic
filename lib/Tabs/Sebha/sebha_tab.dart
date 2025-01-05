import 'package:flutter/material.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbeehWords = ["سبحان الله", "الحمد لله", "الله اكبر"];

  double rotationAngle = 0;
  int counter = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppAssets.logo,
          height: screenSize.height * .20,
        ),
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
          textAlign: TextAlign.center,
          style: AppTheme.darkTheme.textTheme.headlineLarge
              ?.copyWith(fontSize: 26),
        ),
        Center(
          child: Stack(
            children: [
              Positioned(
                top: screenSize.height * .02,
                left: screenSize.width * .30,
                child: Image.asset(
                  AppAssets.sebhaHead,
                ),
              ),
              InkWell(
                onTap: () {
                  handleTasbeeh();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 90),
                  child: AnimatedRotation(
                    turns: rotationAngle / 360,
                    duration: Duration(milliseconds: 500),
                    child: Image.asset(
                      AppAssets.sebhaBody,
                      height: screenSize.height * .4,
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenSize.height * .28,
                left: screenSize.width * .195,
                child: Column(
                  children: [
                    Text(tasbeehWords[index],
                        style: AppTheme.darkTheme.textTheme.headlineLarge
                            ?.copyWith(fontSize: 24)),
                    SizedBox(
                      height: screenSize.height * .04,
                    ),
                    Text("$counter",
                        style: AppTheme.darkTheme.textTheme.headlineLarge
                            ?.copyWith(fontSize: 24))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  handleTasbeeh() {
    setState(() {
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % tasbeehWords.length;
      } else {
        counter++;
      }
      rotationAngle += 10;
    });
  }
}
