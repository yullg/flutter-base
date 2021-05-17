import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../bean/sex.dart';
import '../../core/optional.dart';
import '../infinite_rotating_widget.dart';
import '../smart_button.dart';

typedef SexSubmit = Future<bool> Function(BuildContext context, Sex? sex);

class SexInputPage extends StatefulWidget {
  final String title;
  final Sex? sex;
  final SexSubmit onSubmit;

  SexInputPage({Key? key, this.title = "请选择性别", this.sex, required this.onSubmit}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SexInputPageState();
}

class _SexInputPageState extends State<SexInputPage> {
  late ValueNotifier<Sex?> sexValueNotifier;

  @override
  void initState() {
    super.initState();
    sexValueNotifier = ValueNotifier<Sex?>(widget.sex);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sexValueNotifier,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Consumer<ValueNotifier<Sex?>>(
              builder: (context, notifier, child) {
                Sex? sex = notifier.value;
                return SmartIconButton(
                  icon: Icon(Icons.done),
                  lockedIcon: InfiniteRotatingWidget(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutBack,
                    child: Icon(Icons.hourglass_top),
                  ),
                  onPressed: widget.sex == sex
                      ? null
                      : () async {
                          await widget.onSubmit(context, sex).then((value) {
                            if (value) {
                              Navigator.pop(context, Optional(sex));
                            }
                          }).catchError((e) {});
                        },
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Consumer<ValueNotifier<Sex?>>(
              builder: (context, notifier, child) => Container(
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
                              style: TextStyle(fontSize: 42.sp, color: Sex.male == notifier.value ? Theme.of(context).primaryColor : Colors.black),
                            ),
                          ),
                          if (Sex.male == notifier.value) Icon(Icons.radio_button_checked, color: Theme.of(context).primaryColor),
                        ],
                      ),
                    ),
                    onTap: () {
                      sexValueNotifier.value = Sex.male;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 1),
            Consumer<ValueNotifier<Sex?>>(
              builder: (context, notifier, child) => Container(
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
                              style: TextStyle(fontSize: 44.sp, color: Sex.female == notifier.value ? Theme.of(context).primaryColor : Colors.black),
                            ),
                          ),
                          if (Sex.female == notifier.value) Icon(Icons.radio_button_checked, color: Theme.of(context).primaryColor),
                        ],
                      ),
                    ),
                    onTap: () {
                      sexValueNotifier.value = Sex.female;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    sexValueNotifier.dispose();
    super.dispose();
  }
}