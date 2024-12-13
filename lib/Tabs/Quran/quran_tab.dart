import 'package:flutter/material.dart';
import 'package:islami_app_new/Tabs/Quran/Widgets/most_recent_card.dart';
import 'package:islami_app_new/Tabs/Quran/Widgets/suras_list.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.logo, height: 100),
          TextField(
            style: _txtStyleBuilder(),
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: _txtStyleBuilder(),
              enabledBorder: _borderBuilder(),
              focusedBorder: _borderBuilder(),
              prefixIcon: const ImageIcon(
                AssetImage(AppAssets.quranTxtFieldPrefix),
                color: AppColors.primaryDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Most Recently",
            style: _txtStyleBuilder(),
          ),
          const SizedBox(height: 10),
          const MostRecentCard(),
          const SizedBox(height: 10),
          Text(
            "Suras list",
            style: _txtStyleBuilder(),
          ),
          const SizedBox(height: 10),
          Expanded(child: SurasList())
        ],
      ),
    );
  }

  InputBorder _borderBuilder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: AppColors.primaryDark,
        width: 2,
      ),
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
