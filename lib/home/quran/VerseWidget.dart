import 'package:flutter/material.dart';

class AyaWidget extends StatelessWidget {
  String text;
  int index;

  AyaWidget(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text+'{${index+1}}',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 26),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
