import 'package:flutter/material.dart';

class CustomText extends Text {
  CustomText(String data,
      {color: Colors.black, textAlign: TextAlign.center, factor: 1.0})
      : //fromRGBO(int 120, int 65, int 70, double 0.2)

        super(data,
            textAlign: textAlign,
            textScaleFactor: factor,
            style: new TextStyle(color: color));
}
