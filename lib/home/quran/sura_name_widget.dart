import 'package:flutter/material.dart';

import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';

class SuraNameWidget extends StatelessWidget {
  String name;
  int index;

  SuraNameWidget(this.name, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(color: provider.themeMode == ThemeMode.light
                ? Colors.black
                : Colors.white,fontSize: 24),
          ),
        ),
      ],
    );
  }
}
