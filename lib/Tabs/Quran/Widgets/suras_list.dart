import 'package:flutter/material.dart';
import 'package:islami_app_new/Model/sura_model.dart';
import 'package:islami_app_new/Pages/Quran/sura_details_screen.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class SurasList extends StatelessWidget {
  SurasList({super.key, required this.index, required this.suraModel});

  SuraModel suraModel;
  int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.suraNumberImage),
            Text(
              '$index',
              style: _txtStyleBuilder(),
            )
          ],
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              suraModel.suraEnName,
              style:
                  _txtStyleBuilder(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              '${suraModel.noVerses} verses',
              style: _txtStyleBuilder(fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        Text(
          suraModel.suraArName,
          style: _txtStyleBuilder(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }

  TextStyle _txtStyleBuilder(
      {Color color = AppColors.textLightColor,
      FontWeight? fontWeight,
      double fontSize = 16}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
