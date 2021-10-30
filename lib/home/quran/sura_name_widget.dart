import 'package:flutter/material.dart';
import 'package:islami_sun/home/quran/SuraDetailsScreen.dart';

class SuraNameWidget extends StatelessWidget {
  String name;
  int index;

  SuraNameWidget(this.name, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
