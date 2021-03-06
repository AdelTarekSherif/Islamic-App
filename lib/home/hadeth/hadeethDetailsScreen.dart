import 'package:flutter/material.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';

import 'hadethTab.dart';
class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadethDetails';

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethItem;
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      Image.asset(
        provider.themeMode == ThemeMode.light
            ? 'assets/images/main_background.png'
            : 'assets/images/dark_bg.png',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.title,
              style:TextStyle( color: provider.themeMode == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
                fontSize: 30,)),
          iconTheme: IconThemeData(
            color: provider.themeMode == ThemeMode.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        body: LayoutBuilder(builder: (context,constraints)=> Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.05, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: SingleChildScrollView(
                child: Text(
                  args.content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: constraints.maxWidth*0.06,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              )),
        ),
      )
    ]);
  }
}
