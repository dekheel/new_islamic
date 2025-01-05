import 'package:flutter/material.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(AppAssets.soundWave),
            fit: BoxFit.cover,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  size: 35,
                ),
                color: AppColors.blackColor,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.pause_circle_outline,
                  size: 40,
                ),
                color: AppColors.blackColor,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_up_rounded,
                  size: 35,
                ),
                color: AppColors.blackColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
