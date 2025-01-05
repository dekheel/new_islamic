import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_new/Model/hadeth_model.dart';
import 'package:islami_app_new/Pages/Hadeth/hadeth_details_screen.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';
import 'package:islami_app_new/core/app_theme.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadHadethContent();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = AppTheme.darkTheme.textTheme;
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Image.asset(AppAssets.logo, height: 100),
        Expanded(
          child: CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
                      arguments: hadethList[index]);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryDark,
                      image: const DecorationImage(
                          image: AssetImage(AppAssets.hadethContentBg),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Text(hadethList[index].title,
                          style: textTheme.headlineLarge
                              ?.copyWith(color: AppColors.blackColor)),
                      const SizedBox(height: 5),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(hadethList[index].content.join(""),
                              textAlign: TextAlign.justify,
                              style: textTheme.headlineLarge
                                  ?.copyWith(color: AppColors.blackColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: hadethList.length,
            options: CarouselOptions(
                enableInfiniteScroll: false,
                height: size.height * .66,
                viewportFraction: .75,
                enlargeCenterPage: true),
          ),
        ),
      ],
    );
  }

  void _loadHadethContent() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString("assets/files/Hadeeth/h$i.txt");
      List<String> hadethLines = hadethContent.split("\n");
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel =
          HadethModel(title: hadethTitle, content: hadethLines);
      hadethList.add(hadethModel);
    }
    setState(() {});
  }
}
