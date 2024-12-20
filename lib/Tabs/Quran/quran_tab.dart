import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_new/Model/sura_model.dart';
import 'package:islami_app_new/Pages/Quran/sura_details_screen.dart';
import 'package:islami_app_new/Tabs/Quran/Widgets/most_recent_card.dart';
import 'package:islami_app_new/Tabs/Quran/Widgets/suras_list.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';
import 'package:islami_app_new/core/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    getRecentSura();
    // TODO: implement initState
    super.initState();
  }

  List<SuraModel> filteredSuraList = SuraModel.suraList;
  TextEditingController searchTxt = TextEditingController();

  List<String>? mostRecentSuraNo = [];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = AppTheme.darkTheme.textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.logo, height: 100),
            TextField(
              style: textTheme.headlineLarge,
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
                  hintStyle: textTheme.headlineLarge,
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
            const SizedBox(height: 10),

            searchTxt.text.isEmpty
                ? Text(
                    "Most Recently",
                    style: textTheme.headlineLarge,
                  )
                : const SizedBox.shrink(),

            searchTxt.text.isEmpty
                ? (mostRecentSuraNo != null && mostRecentSuraNo!.isNotEmpty)
                    ? CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          return MostRecentCard(
                              suraModel: SuraModel.suraByIndex(
                                  mostRecentSuraNo![index]),
                              deleteRecent: removeSura);
                        },
                        itemCount: mostRecentSuraNo?.length,
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: 160,
                            reverse: true,
                            viewportFraction: .75,
                            enlargeCenterPage: true),
                      )
                    : MostRecentCard()
                : const SizedBox.shrink(),
            const SizedBox(height: 10),
            Text(
              "Suras list",
              style: AppTheme.darkTheme.textTheme.headlineLarge,
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
                        saveRecentSura(SuraModel.buildSuraNo(sura_model));
                      },
                      child: SurasList(
                          index: SuraModel.buildSuraNo(sura_model),
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

  Future<void> saveRecentSura(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? mostRecent = await getRecentSura();

    if (mostRecent == null) {
      mostRecent?[0] = index.toString();
    } else {
      if (mostRecent.contains(index.toString())) {
        mostRecent.remove(index.toString());
        mostRecent.add(index.toString());
      } else {
        mostRecent.add(index.toString());
      }
    }
    await prefs.setStringList('recent', mostRecent ?? []);
    getRecentSura();

    setState(() {});
  }

  Future<List<String>?> getRecentSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecentSuraNo = prefs.getStringList('recent');
    mostRecentSuraNo = mostRecentSuraNo?.reversed.toList();
    await prefs.setStringList('recent', mostRecentSuraNo ?? []);

    setState(() {});
    return mostRecentSuraNo;
  }

  Future<void> removeSura(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? readSuraList = prefs.getStringList('recent');

    if (readSuraList != null) {
      if (readSuraList.contains(index.toString())) {
        readSuraList.remove(index.toString());
        await prefs.setStringList('recent', readSuraList);
        getRecentSura();
        setState(() {});
      }
    }
  }
}
