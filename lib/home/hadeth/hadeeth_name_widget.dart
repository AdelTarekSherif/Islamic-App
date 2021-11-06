import 'package:flutter/material.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';


import 'hadeethDetailsScreen.dart';
import 'hadethTab.dart';

class HadethNameWidget extends StatelessWidget {
  HadethItem hadeth;

  HadethNameWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hadeth.title,
              style: TextStyle(color: provider.themeMode == ThemeMode.light
                  ? Colors.black
                  : Colors.white,fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
