import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_new/Model/sura_model.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';
import 'package:islami_app_new/core/app_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});
  static const String routeName = "/suraDetailsScreen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraLines = [];
  String suraConCatAyat = "";

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = AppTheme.darkTheme.textTheme;

    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (suraLines.isEmpty) {
      _loadQuranContent(args.fileName);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            args.suraEnName,
            style: textTheme.headlineLarge?.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                color: AppColors.blackColor,
                child: Image.asset(AppAssets.quranContentBg,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity)),
            suraLines.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(args.suraArName,
                          style: textTheme.headlineLarge?.copyWith(
                            color: AppColors.primaryDark,
                          )),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 25),
                            child: Text(suraConCatAyat,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: textTheme.headlineLarge?.copyWith(
                                    color: AppColors.primaryDark, height: 2)),
                          ),
                        ),
                      )
                    ],
                  )
          ],
        ));
  }

  void _loadQuranContent(String fileName) async {
    String quranContent =
        await rootBundle.loadString("assets/files/Suras/$fileName");
    List<String> quranLines = quranContent.split("\n");
    suraLines = quranLines;
    _concatenateQuranContent(quranLines);
    setState(() {});
  }

  _concatenateQuranContent(List<String> quranLines) {
    for (int i = 0; i < quranLines.length; i++) {
      if (quranLines[i].trim().isNotEmpty) {
        suraConCatAyat = "$suraConCatAyat ${quranLines[i].trim()} {[${i + 1}]}";
      }
    }
  }
}
