import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/smart_button.dart';
import '../widget/verification_code_send_button.dart';

typedef _SendVerificationCode = Future<bool> Function(BuildContext context, String phone);

typedef _Submit = Future<void> Function(BuildContext context, String phone, String code);

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
      body: Focus(
        child: Builder(
          builder: (context) => ListView(
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
                    String phone = phoneTextEditingController.text.trim();
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
                  lockedChild: Text("处理中"),
                  onPressed: () async {
                    Focus.of(context).unfocus();
                    String phone = phoneTextEditingController.text.trim(), code = codeTextEditingController.text.trim();
                    await widget.submit(context, phone, code);
                  },
                ),
              ),
            ],
          ),
        ),
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
