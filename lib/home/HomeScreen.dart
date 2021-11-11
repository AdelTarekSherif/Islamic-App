import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'Settings/SettingsTab.dart';
import 'hadeth/hadethTab.dart';
import 'quran/QuranTab.dart';
import 'radio/RadioTab.dart';
import 'tasbeh/TasbehTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
var appBar;
class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    appBar=AppBar(
        title: Text(AppLocalizations.of(context)!.app_title,
            style:TextStyle( color: provider.themeMode == ThemeMode.light
                ? Colors.black
                : Colors.white,
              fontSize: 30,))
    );
    return Stack(
      children: [
        Image.asset(
          provider.themeMode == ThemeMode.light
              ? 'assets/images/main_background.png'
              : 'assets/images/dark_bg.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (index) {
              currentPage = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                      :MyThemeData.DarkPrimaryColor,
                  icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  backgroundColor: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                      :MyThemeData.DarkPrimaryColor,
                  icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  backgroundColor: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                      :MyThemeData.DarkPrimaryColor,
                  icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  backgroundColor: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                      :MyThemeData.DarkPrimaryColor,
                  icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  backgroundColor: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                  :MyThemeData.DarkPrimaryColor,
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting),
            ],
            selectedItemColor: provider.themeMode == ThemeMode.light ? Colors.black
              :Colors.yellow,
          ),
          body: Container(
            child: views[currentPage],
          ),
        ),
      ],
    );
  }

  List<Widget> views = [QuranTab(), HadethTab(), Seb7a(),RadioTab(),SettingsTab()];
}
