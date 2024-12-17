import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_new/Model/sura_model.dart';
import 'package:islami_app_new/Pages/Quran/Widgets/ayah_preview.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

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
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (suraLines.isEmpty) {
      _loadQuranContent(args.suraNo);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            args.suraEnName,
            style: const TextStyle(color: AppColors.primaryDark),
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
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(args.suraArName,
                      style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  suraLines.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryDark,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 25),
                          child: Text(suraConCatAyat,
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.bold)),
                        )
                ],
              ),
            )
          ],
        ));
  }

  void _loadQuranContent(int index) async {
    String quranContent =
        await rootBundle.loadString("assets/files/Suras/$index.txt");
    List<String> quranLines = quranContent.split("\n");
    suraLines = quranLines;
    _concatenateQuranContent(quranLines);
    setState(() {});
  }

  _concatenateQuranContent(List<String> quranLines) {
    for (int i = 0; i < quranLines.length; i++) {
      if (quranLines[i].trim().isNotEmpty) {
        suraConCatAyat = "$suraConCatAyat ${quranLines[i].trim()} {${i + 1}}";
      }
    }
  }
}
