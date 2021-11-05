import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun/home/quran/VerseWidget.dart';
import 'package:islami_sun/main.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) loadSuraContent(args.index);
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.name,
              style:TextStyle( color: Colors.black,
                fontSize: 30,)),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: suraContent.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                itemBuilder: (buildContext, index) {
                  return AyaWidget(suraContent[index], index);
                },
                separatorBuilder: (buildContext, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    height: 1,
                    color: MyThemeData.primaryColor,
                  );
                },
                itemCount: suraContent.length)),
      )
    ]);
  }

  List<String> suraContent = [];

  void loadSuraContent(int index) async {
    String fileContent =
    await rootBundle.loadString('assets/files/${index + 1}.txt');
    suraContent = fileContent.trim().split('\n');
    //   print(suraContent);
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
