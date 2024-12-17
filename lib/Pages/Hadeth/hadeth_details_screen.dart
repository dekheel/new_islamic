import 'package:flutter/material.dart';
import 'package:islami_app_new/Model/hadeth_model.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({Key? key}) : super(key: key);

  static const String routeName = "/hadethDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
        appBar: AppBar(
            // title: Text(
            //   args.title,
            //   style: TextStyle(fontSize: 20, color: AppColors.primaryDark),
            // ),
            ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: AppColors.primaryDark,
                  image: DecorationImage(
                      image: AssetImage(AppAssets.hadethDetailsBg),
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(args.title,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.primaryDark)),
                    SizedBox(height: 10),
                    Text(args.content.join(""),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.primaryDark)),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
