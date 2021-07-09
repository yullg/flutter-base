import 'package:flutter/material.dart';

enum _Mode { dot, num }

class BadgeWidget extends StatelessWidget {
  final _Mode _mode;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double dotDiameter;
  final int count;
  final int maxCount;
  final double fontSize;

  const BadgeWidget.dot(
      {Key? key,
      this.color = Colors.white,
      this.backgroundColor = Colors.red,
      this.borderColor = Colors.white,
      this.borderWidth = 1,
      this.dotDiameter = 10})
      : this._mode = _Mode.dot,
        this.count = 0,
        this.maxCount = 0,
        this.fontSize = 0,
        super(key: key);

  const BadgeWidget.num({
    Key? key,
    this.color = Colors.white,
    this.backgroundColor = Colors.red,
    this.borderColor = Colors.white,
    this.borderWidth = 1,
    required this.count,
    this.maxCount = 99,
    this.fontSize = 12,
  })  : this._mode = _Mode.num,
        this.dotDiameter = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_mode) {
      case _Mode.dot:
        return Container(
          width: dotDiameter,
          height: dotDiameter,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: borderWidth),
          ),
        );
      case _Mode.num:
        var data = count <= maxCount ? "$count" : "$maxCount+";
        if (data.length <= 2) {
          return Container(
            padding: EdgeInsets.all(4 / data.length),
            decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle, border: Border.all(color: borderColor, width: borderWidth)),
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
