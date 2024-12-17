import 'package:flutter/material.dart';
import 'package:islami_app_new/Model/sura_model.dart';
import 'package:islami_app_new/Pages/Quran/sura_details_screen.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class SurasList extends StatelessWidget {
  SurasList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          SuraModel sura_model = SuraModel.suraByIndex(index);
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                  arguments: sura_model);
            },
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppAssets.suraNumberImage),
                    Text(
                      '${index + 1}',
                      style: _txtStyleBuilder(),
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sura_model.suraEnName,
                      style: _txtStyleBuilder(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      '${sura_model.noVerses} verses',
                      style: _txtStyleBuilder(fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  sura_model.suraArName,
                  style: _txtStyleBuilder(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: AppColors.textLightColor,
          );
        },
        itemCount: SuraModel.arabicQuranSuras.length);
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
