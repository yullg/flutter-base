import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/smart_button.dart';
import '../widget/verification_code_send_button.dart';

typedef _SendVerificationCode = Future<bool> Function(BuildContext context, String email);

typedef _Submit = Future<void> Function(BuildContext context, String email, String code);

class ChangeEmailPage extends StatefulWidget {
  final _SendVerificationCode sendVerificationCode;
  final _Submit submit;

  ChangeEmailPage({Key? key, required this.sendVerificationCode, required this.submit}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  late TextEditingController emailTextEditingController;
  late TextEditingController codeTextEditingController;

  @override
  void initState() {
    super.initState();
    emailTextEditingController = TextEditingController();
    codeTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("修改关联邮箱"),
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
                    Text("邮箱：", style: TextStyle(fontSize: 42.sp)),
                    Expanded(
                      child: TextField(
                        controller: emailTextEditingController,
                        textAlign: TextAlign.end,
                        maxLength: 100,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: "请输入邮箱",
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
                    String email = emailTextEditingController.text.trim();
                    return await widget.sendVerificationCode(context, email);
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
                    String email = emailTextEditingController.text.trim(), code = codeTextEditingController.text.trim();
                    await widget.submit(context, email, code);
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
    emailTextEditingController.dispose();
    codeTextEditingController.dispose();
    super.dispose();
  }
}
