import 'package:flutter/material.dart';

import '../bean/sex.dart';

class SexAndAgeWidget extends StatelessWidget {
  final Sex sex;
  final int age;

  const SexAndAgeWidget(this.sex, this.age, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Sex.male == sex) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.blue[300],
          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.build, color: Colors.white, size: 10),
              SizedBox(width: 3),
              Text("$age", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      );
    } else if (Sex.female == sex) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.pink[300],
          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.face, color: Colors.white, size: 10),
              SizedBox(width: 3),
              Text("$age", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }
}
