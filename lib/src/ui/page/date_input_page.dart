import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/result.dart';
import '../widget/infinite_rotating_widget.dart';
import '../widget/smart_button.dart';

typedef _Submit = Future<bool> Function(BuildContext context, DateTime? value);

class DateInputPage extends StatefulWidget {
  final String title;
  final DateTime? dateTime;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final _Submit submit;

  DateInputPage({Key? key, this.title = "请选择日期", this.dateTime, this.startDateTime, this.endDateTime, required this.submit}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateInputPageState();
}

class _DateInputPageState extends State<DateInputPage> {
  late ValueNotifier<DateTime> dateTimeValueNotifier;

  @override
  void initState() {
    super.initState();
    dateTimeValueNotifier = ValueNotifier<DateTime>(widget.dateTime ?? DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final DateTime nowDate = DateTime.now();
    return ChangeNotifierProvider.value(
      value: dateTimeValueNotifier,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Consumer<ValueNotifier<DateTime>>(
              builder: (context, notifier, child) {
                DateTime dateTime = notifier.value;
                return SmartIconButton(
                  icon: Icon(Icons.done),
                  lockedIcon: InfiniteRotatingWidget(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutBack,
                    child: Icon(Icons.hourglass_top),
                  ),
                  onPressed: widget.dateTime == dateTime
                      ? null
                      : () async {
                          await widget.submit(context, dateTime).then((value) {
                            if (value) {
                              Navigator.pop(context, Result.withData(dateTime));
                            }
                          });
                        },
                );
              },
            ),
          ],
        ),
        body: CalendarDatePicker(
          currentDate: nowDate,
          initialDate: dateTimeValueNotifier.value,
          firstDate: widget.startDateTime ?? DateTime(nowDate.year - 150),
          lastDate: widget.endDateTime ?? nowDate,
          onDateChanged: (value) => dateTimeValueNotifier.value = value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    dateTimeValueNotifier.dispose();
    super.dispose();
  }
}
