import 'package:flutter/material.dart';
import 'package:islami_app_new/Model/sura_model.dart';
import 'package:islami_app_new/Pages/Quran/sura_details_screen.dart';
import 'package:islami_app_new/Tabs/Quran/Widgets/most_recent_card.dart';
import 'package:islami_app_new/Tabs/Quran/Widgets/suras_list.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraEnName: SuraModel.englishQuranSurahs[i],
          suraArName: SuraModel.arabicQuranSuras[i],
          noVerses: SuraModel.AyaNumber[i],
          fileName: "${i + 1}.txt"));
    }
  }

  @override
  void initState() {
    addSuraList();
    // TODO: implement initState
    super.initState();
  }

  List<SuraModel> filteredSuraList = SuraModel.suraList;
  TextEditingController searchTxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.logo, height: 100),
            TextField(
              style: _txtStyleBuilder(),
              cursorColor: AppColors.whiteColor,
              controller: searchTxt,
              onChanged: (value) {
                searchTxt.text = value;
                setState(() {
                  if (searchTxt.text.isNotEmpty) {
                    filteredSuraList = SuraModel.suraList.where((sura) {
                      return sura.suraEnName
                              .toLowerCase()
                              .contains(value.toLowerCase()) ||
                          sura.suraArName
                              .toLowerCase()
                              .contains(value.toLowerCase()) ||
                          sura.fileName.split(".txt").contains(value);
                    }).toList();
                  } else {
                    filteredSuraList = SuraModel.suraList;
                  }
                });
              },
              decoration: InputDecoration(
                  hintText: 'Sura Name',
                  hintStyle: _txtStyleBuilder(),
                  enabledBorder: _borderBuilder(),
                  focusedBorder: _borderBuilder(),
                  prefixIcon: const ImageIcon(
                    AssetImage(AppAssets.quranTxtFieldPrefix),
                    color: AppColors.primaryDark,
                  ),
                  suffixIcon: searchTxt.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            searchTxt.clear();
                            filteredSuraList = SuraModel.suraList;

                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.clear,
                          ),
                          color: AppColors.primaryDark,
                        )
                      : null),
            ),
            searchTxt.text.isEmpty
                ? const MostRecentCard()
                : const SizedBox.shrink(),
            const SizedBox(height: 10),
            Text(
              "Suras list",
              style: _txtStyleBuilder(),
            ),
            // const SizedBox(height: 10),
            SizedBox(
              height: 600,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    SuraModel sura_model = filteredSuraList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            SuraDetailsScreen.routeName,
                            arguments: sura_model);
                      },
                      child: SurasList(
                          index: int.parse(sura_model.fileName
                              .substring(0, sura_model.fileName.indexOf('.'))),
                          suraModel: sura_model),
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
                  itemCount: filteredSuraList.length),
            )
          ],
        ),
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
