import 'package:flutter/material.dart';
import 'package:islami_app_new/Pages/Quran/sura_details_screen.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';
import 'package:islami_app_new/core/app_theme.dart';

import '../../../Model/sura_model.dart';

class MostRecentCard extends StatelessWidget {
  MostRecentCard({super.key, this.suraModel, this.deleteRecent});

  final SuraModel? suraModel;
  Future<void> Function(int index)? deleteRecent;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = AppTheme.darkTheme.textTheme;

    return suraModel != null
        ? Stack(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                        arguments: suraModel);
                  },
                  child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    suraModel!.suraArName,
                                    style: textTheme.bodyLarge
                                        ?.copyWith(color: AppColors.blackColor),
                                  ),
                                  Text(suraModel!.suraEnName,
                                      style: textTheme.bodyLarge?.copyWith(
                                          color: AppColors.blackColor)),
                                  Text(suraModel!.noVerses,
                                      style: textTheme.bodyLarge?.copyWith(
                                          color: AppColors.blackColor)),
                                ],
                              ),
                              Image.asset(AppAssets.recentQuranImage)
                            ],
                          ),
                        ],
                      ))),
              Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Color.fromARGB(255, 47, 47, 47),
                    child: IconButton(
                      onPressed: () {
                        deleteRecent!(SuraModel.buildSuraNo(suraModel!));
                      },
                      icon: Icon(
                        Icons.delete,
                      ),
                      iconSize: 15,
                      color: AppColors.primaryDark,
                    ),
                  ))
            ],
          )
        : Text(
            textAlign: TextAlign.center,
            "No History",
            style:
                textTheme.headlineLarge?.copyWith(color: AppColors.primaryDark),
          );
  }
}
