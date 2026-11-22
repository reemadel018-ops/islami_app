import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/ui/screens/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/ui/screens/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/screens/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundImagesList =[
    'assets/images/quran_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/ssebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png'

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Image.asset(
            backgroundImagesList[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              spacing: context.height*0.02,
              children: [
                Image.asset('assets/images/intro_logo.png'),
                Expanded(child: tabsList[selectedIndex]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.gold),
        child: BottomNavigationBar(
     
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            builtBottomNavigationBarItem(
              icon: 'assets/images/quran_icon.png',
              label: 'Quran',
              index: 0,
            ),
            builtBottomNavigationBarItem(
              icon: 'assets/images/ic_hadeth.png',
              label: 'Hadeth',
              index: 1,
            ),
            builtBottomNavigationBarItem(
              icon: 'assets/images/ic_sebha.png',
              label: 'Sebha',
              index: 2,
            ),
            builtBottomNavigationBarItem(
              icon: 'assets/images/ic_radio.png',
              label: 'Radio',
              index: 3,
            ),
            builtBottomNavigationBarItem(
              icon: 'assets/images/ic_time.png',
              label: 'Time',
              index: 4,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.lightBlack,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),

              child: ImageIcon(AssetImage(icon)),
            )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
