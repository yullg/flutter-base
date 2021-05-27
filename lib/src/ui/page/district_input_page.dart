import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../bean/district.dart';
import '../../core/optional.dart';
import '../../helper/district_helper.dart';
import '../infinite_rotating_widget.dart';
import '../smart_button.dart';

typedef DistrictSubmit = Future<bool> Function(BuildContext context, District? value);

class DistrictInputPage extends StatefulWidget {
  final String title;
  final District? district;
  final int? maxLevel;
  final DistrictSubmit onSubmit;

  DistrictInputPage({Key? key, this.title = "请选择城市", this.district, this.maxLevel, required this.onSubmit}) : super(key: key);

  @override
  State createState() => _DistrictInputPageState();
}

class _DistrictInputPageState extends State<DistrictInputPage> {
  late ValueNotifier<District?> districtValueNotifier;

  @override
  void initState() {
    super.initState();
    districtValueNotifier = ValueNotifier<District?>(widget.district);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: districtValueNotifier,
      child: WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: BackButton(onPressed: onBackClick),
            title: Consumer<ValueNotifier<District?>>(
              builder: (context, notifier, child) => Text(notifier.value?.fullname ?? widget.title),
            ),
            actions: [
              Consumer<ValueNotifier<District?>>(
                builder: (context, notifier, child) {
                  District? district = notifier.value;
                  return SmartIconButton(
                    icon: Icon(Icons.done),
                    lockedIcon: InfiniteRotatingWidget(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutBack,
                      child: Icon(Icons.hourglass_top),
                    ),
                    onPressed: widget.district == district
                        ? null
                        : () async {
                            await widget.onSubmit(context, district).then((value) {
                              if (value) {
                                Navigator.pop(context, Optional(district));
                              }
                            }).catchError((e) {});
                          },
                  );
                },
              ),
            ],
          ),
          body: Consumer<ValueNotifier<District?>>(
            builder: (context, notifier, child) => ListView(
              children: [
                ...districts(districtValueNotifier.value).map((district) => Container(
                      margin: EdgeInsets.only(bottom: 1),
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
                                    district.fullname,
                                    style: TextStyle(
                                        fontSize: 42.sp, color: district.id == notifier.value?.id ? Theme.of(context).primaryColor : Colors.black),
                                  ),
                                ),
                                if (district.id == notifier.value?.id) Icon(Icons.radio_button_checked, color: Theme.of(context).primaryColor),
                              ],
                            ),
                          ),
                          onTap: () {
                            districtValueNotifier.value = district;
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          onBackClick();
          return false;
        },
      ),
    );
  }

  List<District> districts(District? selectedDistrict) {
    if (selectedDistrict == null) return DistrictHelper.subDistricts(null);
    int? maxLevel = widget.maxLevel;
    if (maxLevel == null || selectedDistrict.level < maxLevel) {
      if (DistrictHelper.hasSubDistrict(selectedDistrict.id)) {
        return DistrictHelper.subDistricts(selectedDistrict.id);
      }
    }
    return DistrictHelper.subDistricts(selectedDistrict.pid);
  }

  void onBackClick() {
    var selectedDistrict = districtValueNotifier.value;
    if (selectedDistrict != null) {
      var parentDistrict = DistrictHelper.findDistrict(selectedDistrict.pid);
      districtValueNotifier.value = parentDistrict;
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    districtValueNotifier.dispose();
    super.dispose();
  }
}
