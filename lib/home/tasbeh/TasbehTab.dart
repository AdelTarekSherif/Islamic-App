import 'package:flutter/material.dart';
import 'package:islami_sun/main.dart';
import 'dart:math';
class Seb7a extends StatefulWidget {
  @override
  _Seb7aState createState() => _Seb7aState();
}
class _Seb7aState extends State<Seb7a> {
  int _counter = 0;
  List<String> text=['سبحان الله','الحمد الله','الله اكبر'];
  int text_count=0;
  double rotateValue=0;
  void _incrementCounter() {
    TextState();
    setState(() {
      _counter++;
      rotateValue+=3.63;
    });
  }
  void TextState(){
    setState(() {
      if(_counter==33) {
        _counter = 0;
        if (text_count < text.length-1)
          text_count ++;
        else
          text_count=0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    //TextState();
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: InkWell(
            onTap:  _incrementCounter,
            child: Stack(
              children: [
                Positioned(
                    top: 13,
                    left: 180,
                    child: Image.asset('assets/images/head_sebha_logo.png')),
                Positioned(
                  top: 93,
                  left: 80,
                  bottom: 20,
                  child: Transform.rotate(angle: rotateValue*(pi/180),
                      child: Image.asset('assets/images/body_of_seb7a.png')),
                ),
              ],
            )
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  'عدد التسبيحات',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 18,left: 18,top: 26,bottom: 26),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(201, 179, 150, 1.0),
                ),
                child: Text(
                  '$_counter',
                  style: TextStyle(
                      color: Colors.black,
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
                      color:MyThemeData.primaryColor,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Text('${text[text_count]}',style: TextStyle(
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