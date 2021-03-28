import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final int count;
  final int overflowCount;
  final double dotDiameter;
  final Color color;
  final Color backgroundColor;
  final double fontSize;
  final Color borderColor;
  final double borderWidth;

  BadgeWidget(
      {Key? key,
      required this.count,
      this.overflowCount = 99,
      this.dotDiameter = 10,
      this.color = Colors.white,
      this.backgroundColor = Colors.red,
      this.fontSize = 12,
      this.borderColor = Colors.white,
      this.borderWidth = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (count <= 0) {
      return Container(
        width: dotDiameter,
        height: dotDiameter,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: borderWidth),
        ),
      );
    } else {
      var data = count <= overflowCount ? "$count" : "$overflowCount+";
      if (data.length <= 2) {
        return Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: borderWidth)),
          child: Text(data, style: TextStyle(color: color, fontSize: fontSize)),
        );
      } else {
        return Container(
          padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: StadiumBorder(side: BorderSide(color: borderColor, width: borderWidth)),
          ),
          child: Text(data, style: TextStyle(color: color, fontSize: fontSize)),
        );
      }
    }
  }
}