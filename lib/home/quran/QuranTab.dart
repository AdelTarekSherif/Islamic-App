import 'package:flutter/material.dart';
import 'package:islami_sun/main.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../HomeScreen.dart';
import 'SuraDetailsScreen.dart';

class QuranTab extends StatelessWidget {
  final List<String> names = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  final List<int>ayatNumbers = [
    7,286,200,176,120,165,206,75,129,109,123,111,43,52,99,128,111,
    110, 98, 135, 112, 78, 118, 64, 77, 227, 93, 88, 69, 60, 34, 30, 73, 54, 45, 83,
    182, 88, 75, 85, 54, 53, 89, 59, 37, 35, 38, 29, 18, 45, 60, 49, 62, 55, 78, 96, 29, 22, 24, 13, 14,
    11, 11,18,12,12,30,52,52,44,28,28,20,56,40,31,50,40,46,42,29,19,36,25,22,17,19,26,30,20,15,21,11,8,8,19,5,8,8,11,11,8,3,9,5,4,7,3,6,3,5,4,5,6
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return LayoutBuilder(builder: (context,constraints)=>Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset('assets/images/quran_top_logo.png')),
        Container(
          height: 3,
          color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
              :MyThemeData.darkAccentColor,
        ),
        Container(
          height: (MediaQuery.of(context).size.height- appBar.preferredSize.height
              -MediaQuery.of(context).padding.top)*.1,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth*.5,
                      child: FittedBox(
                        child: Text(AppLocalizations.of(context)!.versesNumber,style: TextStyle(
                            color: provider.themeMode == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize:(constraints.maxWidth )*.5,
                          //fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               Expanded(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth*.5,
                      child: FittedBox(
                        child: Text(AppLocalizations.of(context)!.suraName,style: TextStyle(
                            color: provider.themeMode == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: (constraints.maxWidth )*.5,
                            //fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ],
              ),
               ),
            ],
          ),
        ),
        Container(
          height: 3,
          color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
              :MyThemeData.darkAccentColor,
        ),
        Container(
          height: (MediaQuery.of(context).size.height- appBar.preferredSize.height
              -MediaQuery.of(context).padding.top)*.6,
          child: ListView.separated(
            itemBuilder: (buildContext, index) {
              return Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                            arguments: SuraDetailsArgs(name: names[index], index: index));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${ayatNumbers[index]}',style: TextStyle(
                                    color: provider.themeMode == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: constraints.maxWidth*0.05,
                                ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text( names[index],
                                  style: TextStyle(color: provider.themeMode == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,fontSize: constraints.maxWidth*0.05,
                                  ),
                                  textDirection: TextDirection.rtl,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: names.length,
            separatorBuilder: (buildContext, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                height: 3,
                color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                  :MyThemeData.darkAccentColor,
              );
            },
          ),
        )
      ],
    )
    );
  }
}
