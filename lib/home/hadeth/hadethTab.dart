import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun/main.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';

import 'hadeeth_name_widget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethItem> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (allHadeth.isEmpty) parseHadethFile();
    return Column(
      children: [
        Expanded(
            flex: 1, child: Image.asset('assets/images/hadeth_top_logo.png')),
        Expanded(
            flex: 3,
            child: allHadeth.isEmpty
                ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : ListView.separated(
                itemBuilder: (buildContext, index) {
                  return HadethNameWidget(allHadeth[index]);
                },
                separatorBuilder: (buildContext, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    height: 1,
                    color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                        :MyThemeData.darkAccentColor,
                  );
                },
                itemCount: allHadeth.length))
      ],
    );
  }

  void parseHadethFile() async {
    List<HadethItem> ahadtheData = [];
    String fileContent =
    await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadeth = fileContent.split('\r\n#');
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethLines = ahadeth[i].split('\r\n');
      if (hadethLines[0].isEmpty) {
        hadethLines.removeAt(0);
      }
      String title = hadethLines[0];
      String content = '';
      for (int j = 1; j < hadethLines.length; j++) {
        content += hadethLines[j] + ' ';
      }
      HadethItem item = HadethItem(title, content);
      ahadtheData.add(item);
    }
    setState(() {
      allHadeth = ahadtheData;
    });
  }
}

class HadethItem {
  String title;
  String content;
  HadethItem(this.title, this.content);
}