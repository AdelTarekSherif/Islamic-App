import 'package:flutter/material.dart';

import 'hadethTab.dart';
class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadethDetails';

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethItem;

    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.title,
              style:TextStyle( color: Colors.black,
                fontSize: 30,)),
        ),
        body: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 96, horizontal: 24),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: SingleChildScrollView(
              child: Text(
                args.content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            )),
      )
    ]);
  }
}
