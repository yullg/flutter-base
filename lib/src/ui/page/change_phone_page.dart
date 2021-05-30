import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/optional.dart';
import '../../helper/common_field_helper.dart';
import '../../helper/toast_helper.dart';
import '../smart_button.dart';
import '../verification_code_send_button.dart';

typedef _SendVerificationCode = Future<bool> Function(BuildContext context, String phone);

typedef _Submit = Future<bool> Function(BuildContext context, String phone, String code);

class ChangePhonePage extends StatefulWidget {
  final _SendVerificationCode sendVerificationCode;
  final _Submit submit;

  ChangePhonePage({Key? key, required this.sendVerificationCode, required this.submit}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePhonePageState();
}

class _ChangePhonePageState extends State<ChangePhonePage> {
  late TextEditingController phoneTextEditingController;
  late TextEditingController codeTextEditingController;

  @override
  void initState() {
    super.initState();
    phoneTextEditingController = TextEditingController();
    codeTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("修改手机号码"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Row(
              children: [
                Text("手机号：", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: phoneTextEditingController,
                    textAlign: TextAlign.end,
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "请输入手机号",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
                  ),
                  child: Row(
                    children: [
                      Text("验证码：", style: TextStyle(fontSize: 42.sp)),
                      Expanded(
                        child: TextField(
                          controller: codeTextEditingController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.end,
                          maxLength: 8,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "请输入验证码",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15),
              VerificationCodeSendElevatedButton(onPressed: () async {
                String phone = phoneTextEditingController.text;
                if (!CommonFieldHelper.isValidPhone(phone)) {
                  ToastHelper.show("无效的手机号参数");
                  return false;
                }
                return await widget.sendVerificationCode(context, phone);
              }),
              SizedBox(width: 15),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SmartElevatedButton(
              child: Text("完成"),
              onPressed: () async {
                String phone = phoneTextEditingController.text;
                String code = codeTextEditingController.text;
                if (!(CommonFieldHelper.isValidPhone(phone) && CommonFieldHelper.isValidVerificationCode(code))) {
                  ToastHelper.show("无效的输入参数");
                  return;
                }
                await widget.submit(context, phone, code).then((value) {
                  if (value) {
                    Navigator.pop(context, Optional(true));
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    phoneTextEditingController.dispose();
    codeTextEditingController.dispose();
    super.dispose();
  }
}
