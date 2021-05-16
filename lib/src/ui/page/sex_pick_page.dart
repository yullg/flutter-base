import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bean/sex.dart';
import '../../core/optional.dart';

class SexPickPage extends StatelessWidget {
  final String title;
  final Sex? sex;

  SexPickPage({Key? key, this.title = "选择性别", this.sex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "男",
                          style: TextStyle(fontSize: 42.sp, color: Sex.male == sex ? Theme.of(context).primaryColor : Colors.black),
                        ),
                      ),
                      if (Sex.male == sex) Icon(Icons.radio_button_checked, color: Theme.of(context).primaryColor),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, Optional(Sex.male));
                },
              ),
            ),
          ),
          SizedBox(height: 1),
          Container(
            color: Colors.white,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "女",
                          style: TextStyle(fontSize: 44.sp, color: Sex.female == sex ? Theme.of(context).primaryColor : Colors.black),
                        ),
                      ),
                      if (Sex.female == sex) Icon(Icons.radio_button_checked, color: Theme.of(context).primaryColor),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, Optional(Sex.female));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
