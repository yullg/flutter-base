import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bean/sex.dart';

class SexAgeWidget extends StatelessWidget {
  final Sex sex;
  final int age;

  const SexAgeWidget(this.sex, this.age, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (sex) {
      case Sex.male:
        return Container(
          padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
          decoration: ShapeDecoration(
            color: Colors.blue.shade300,
            shape: StadiumBorder(),
          ),
          child: Text.rich(TextSpan(children: [
            WidgetSpan(child: Icon(Icons.male, color: Colors.white, size: 34.sp), alignment: PlaceholderAlignment.middle),
            TextSpan(text: "$age", style: TextStyle(color: Colors.white, fontSize: 34.sp)),
          ])),
        );
      case Sex.female:
        return Container(
          padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
          decoration: ShapeDecoration(
            color: Colors.pink.shade300,
            shape: StadiumBorder(),
          ),
          child: Text.rich(TextSpan(children: [
            WidgetSpan(child: Icon(Icons.female, color: Colors.white, size: 34.sp), alignment: PlaceholderAlignment.middle),
            TextSpan(text: "$age", style: TextStyle(color: Colors.white, fontSize: 34.sp)),
          ])),
        );
    }
  }
}
