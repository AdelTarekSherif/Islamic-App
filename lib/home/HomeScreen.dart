import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_sun/home/quran/QuranTab.dart';
import 'package:islami_sun/home/radio/RadioTab.dart';
import 'package:islami_sun/home/tasbeh/TasbehTab.dart';

import 'package:islami_sun/main.dart';

import 'Settings/SettingsTab.dart';
import 'hadeth/hadethTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.app_title,
                  style:TextStyle( color: Colors.black,
                    fontSize: 30,))
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyThemeData.primaryColor),
            child: BottomNavigationBar(
              currentIndex: currentPage,
              onTap: (index) {
                currentPage = index;
                setState(() {});
              },
              backgroundColor: MyThemeData.primaryColor,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                    label: AppLocalizations.of(context)!.radio),

              ],
            ),
          ),
          body: Container(
            child: views[currentPage],
          ),
        ),
      ],
    );
  }

  List<Widget> views = [QuranTab(), HadethTab(), Seb7a(),RadioTab()];
}
