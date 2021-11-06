import 'package:flutter/material.dart';
import 'package:islami_sun/main.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'dart:math';

import 'package:provider/provider.dart';
class Seb7a extends StatefulWidget {
  @override
  _Seb7aState createState() => _Seb7aState();
}
class _Seb7aState extends State<Seb7a> {
  int _counter = 0;
  List<String> text=['سبحان الله','الحمد الله','الله اكبر'];
  int textCount=0;
  double rotateValue=0;
  void _incrementCounter() {
    textState();
    setState(() {
      _counter++;
      rotateValue+=3.63;
    });
  }
  void textState(){
    setState(() {
      if(_counter==33) {
        _counter = 0;
        if (textCount < text.length-1)
          textCount ++;
        else
          textCount=0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: InkWell(
            onTap:  _incrementCounter,
            child: Container(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.088),
                    child: Image.asset(
                      provider.themeMode == ThemeMode.light
                          ? 'assets/images/head_sebha_logo.png'
                          : 'assets/images/head_sebha_dark.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.106),
                    child: Transform.rotate(angle: rotateValue*(pi/180),
                        child:  Image.asset(
                          provider.themeMode == ThemeMode.light
                              ? 'assets/images/body_of_seb7a.png'
                              : 'assets/images/body_sebha_dark.png',
                        ),),
                  ),
                ],
              ),
            )
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  'عدد التسبيحات',
                  style: TextStyle(
                      color: provider.themeMode == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 18,left: 18,top: 26,bottom: 26),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                      :MyThemeData.DarkPrimaryColor,
                ),
                child: Text(
                  '$_counter',
                  style: TextStyle(
                      color: provider.themeMode == ThemeMode.light ? Colors.black
                          :Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor
                          :MyThemeData.darkAccentColor,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Text('${text[textCount]}',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}