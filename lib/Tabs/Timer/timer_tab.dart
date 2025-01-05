import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class TimeTab extends StatefulWidget {
  @override
  State<TimeTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimeTab> {
  bool isMuted = false;
  List<String> prayers = [
    "Fajr",
    "Sunrise",
    "Dhuhr",
    "Asr",
    "Maghrib",
    "Isha",
  ];
  List<String> times = ["05:16", "06:50", "11:54", "02:40", "04:58", "06:23"];
  List<String> am_pm = ["AM", "AM", "AM", "PM", "PM", "PM"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.logo,
            height: 125,
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/times_background.png"))),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: 18, end: 18, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget("16 Jul,\n2024", 16),
                      Text(
                        "Prayer Time\nTuesday",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xB5202020),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      textWidget("09 Muh,\n1446", 16),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 0.30,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    enlargeFactor: 0.2,
                  ),
                  itemCount: prayers.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    margin: EdgeInsets.only(left: 7),
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.blackColor,
                          AppColors.primaryDark,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget(prayers[itemIndex], 14),
                        textWidget(times[itemIndex], 24),
                        textWidget(am_pm[itemIndex], 14)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Next Pray ",
                        style: TextStyle(
                            color: Color(0xBF202020),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "- 02:40 ",
                        style: TextStyle(
                            color: Color(0xFF202020),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            isMuted ? Icons.volume_off : Icons.volume_up,
                            color: Colors.black,
                          ),
                          onPressed: () {})
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          textWidget("Azkar", align: TextAlign.start, 25),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            Expanded(child: Image.asset("assets/images/azkar1.png")),
            SizedBox(
              width: 10,
            ),
            Expanded(child: Image.asset("assets/images/azkar2.png")),
          ]),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget textWidget(String text, double font, {TextAlign? align}) {
    return Text(
      text,
      textAlign: align ?? TextAlign.center,
      style: TextStyle(fontSize: font, color: Color(0xFFFFFFFF)),
    );
  }
}
