import 'package:flutter/material.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class MostRecentCard extends StatelessWidget {
  const MostRecentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Text(
          "Most Recently",
          style: _txtStyleBuilder(),
        ),
        const SizedBox(height: 10),
        Container(
            height: 100,
            decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SuraEn",
                      style: _txtStyleBuilder(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("SuraAr",
                        style: _txtStyleBuilder(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold)),
                    Text("Aya Number",
                        style: _txtStyleBuilder(color: AppColors.blackColor)),
                  ],
                ),
                Image.asset(AppAssets.recentQuranImage)
              ],
            )),
      ],
    );
  }

  TextStyle _txtStyleBuilder(
      {Color color = AppColors.textLightColor, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 16,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
