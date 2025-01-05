import 'package:flutter/material.dart';
import 'package:islami_app_new/Tabs/Radio/widgets/radio_widget.dart';
import 'package:islami_app_new/core/app_assets.dart';
import 'package:islami_app_new/core/app_colors.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;
  List<String> shiekhs = [
    "Ali Mahmoud",
    "Muhammad Rifaat",
    "Muhammad Ahmed Shabib",
    "Abdel Fattah Al-Shasha’i",
    "Mahmoud Ali Al-Banna",
    "Abdel Basset Abdel Samad",
    "Muhammad Siddiq Al-Minshawi",
  ];
  List<String> radios = [
    "Ahl al-Qur’an",
    "Saad Al-Ghamdi",
    "Abu Bakr Al-Shatri",
    "Al-Ruqyah Sharia",
    "Al-Ruqyah Sharia",
    "Al-Ruqyah Sharia",
    "Al-Ruqyah Sharia",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.logo,
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            spacing: 10,
            children: [
              _buildRadioTab(
                active: selectedIndex == 0,
                title: "Radio",
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              _buildRadioTab(
                active: selectedIndex == 1,
                title: "Reciters",
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return RadioWidget(
                  title: selectedIndex == 0 ? radios[index] : shiekhs[index]);
            },
            itemCount: radios.length,
          ),
        )
      ],
    );
  }

  Expanded _buildRadioTab(
      {required bool active,
      required String title,
      required void Function() onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: active ? AppColors.primaryDark : AppColors.blackColor,
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            title,
            style: TextStyle(
                color: active ? AppColors.blackColor : AppColors.whiteColor,
                fontSize: 15,
                fontWeight: active ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
