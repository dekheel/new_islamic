import 'package:flutter/material.dart';
import 'package:islami_app_new/Model/sura_model.dart';
import 'package:islami_app_new/Pages/Quran/sura_details_screen.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';
import 'package:islami_app_new/core/app_theme.dart';

class SurasList extends StatelessWidget {
  SurasList({super.key, required this.index, required this.suraModel});

  SuraModel suraModel;
  int index;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = AppTheme.darkTheme.textTheme;

    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.suraNumberImage),
            Text(
              '$index',
              style: textTheme.bodyLarge,
            )
          ],
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              suraModel.suraEnName,
              style: textTheme.bodyLarge,
            ),
            Text(
              '${suraModel.noVerses} verses',
              style: textTheme.bodySmall,
            ),
          ],
        ),
        const Spacer(),
        Text(
          suraModel.suraArName,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
