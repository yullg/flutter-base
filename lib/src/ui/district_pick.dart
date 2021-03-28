import 'package:flutter/material.dart';

import '../bean/district.dart';
import '../helper/district_helper.dart';

class DistrictPickPage extends StatefulWidget {
  final String title;
  final int maxLevel;

  DistrictPickPage({Key? key, this.title = "选择城市", this.maxLevel = 2}) : super(key: key);

  @override
  State createState() => _DistrictPickPageState();
}

class _DistrictPickPageState extends State<DistrictPickPage> {
  District? parentDistrict;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          leading: BackButton(onPressed: onBackClick),
          title: Text(parentDistrict?.fullname ?? widget.title),
        ),
        body: ListView(
          key: ObjectKey(parentDistrict),
          children: [
            ...DistrictHelper.subDistricts(parentDistrict?.id).map((district) => Container(
                  margin: EdgeInsets.only(bottom: 1),
                  color: Colors.white,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(district.fullname),
                      ),
                      onTap: () {
                        if (district.level >= widget.maxLevel ||
                            !DistrictHelper.hasSubDistrict(district.id)) {
                          Navigator.pop(context, district);
                        } else {
                          setState(() => parentDistrict = district);
                        }
                      },
                    ),
                  ),
                )),
          ],
        ),
      ),
      onWillPop: () async {
        onBackClick();
        return false;
      },
    );
  }

  void onBackClick() {
    if (parentDistrict == null) {
      Navigator.pop(context);
    } else {
      setState(() => parentDistrict = DistrictHelper.findDistrict(parentDistrict?.pid));
    }
  }
}
