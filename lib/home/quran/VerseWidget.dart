import 'package:flutter/material.dart';

class AyaWidget extends StatelessWidget {
  String text;
  int index;
var constraints;
  AyaWidget(this.text, this.index,this.constraints);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints)=>Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text+'{${index+1}}',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: constraints.maxWidth*0.08),
        textDirection: TextDirection.rtl,
      ),
    )
    );
  }
}
