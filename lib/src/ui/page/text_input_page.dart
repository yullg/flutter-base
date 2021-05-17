import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/optional.dart';
import '../infinite_rotating_widget.dart';
import '../smart_button.dart';

typedef TextSubmit = Future<bool> Function(BuildContext context, String? value);

class TextInputPage extends StatefulWidget {
  final String title;
  final String? text;
  final String? helperText;
  final String? hintText;
  final int? maxLength;
  final TextSubmit onSubmit;

  TextInputPage({Key? key, this.title = "请输入", this.text, this.helperText, this.hintText, this.maxLength, required this.onSubmit}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: textEditingController,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Consumer<TextEditingController>(
              builder: (context, notifier, child) {
                String text = notifier.text;
                return SmartIconButton(
                  icon: Icon(Icons.done),
                  lockedIcon: InfiniteRotatingWidget(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutBack,
                    child: Icon(Icons.hourglass_top),
                  ),
                  onPressed: widget.text == text
                      ? null
                      : () async {
                          await widget.onSubmit(context, text).then((value) {
                            if (value) {
                              Navigator.pop(context, Optional(text));
                            }
                          }).catchError((e) {});
                        },
                );
              },
            ),
          ],
        ),
        body: TextField(
          controller: textEditingController,
          maxLines: null,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            helperText: widget.helperText,
            hintText: widget.hintText,
            contentPadding: EdgeInsets.all(15),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
