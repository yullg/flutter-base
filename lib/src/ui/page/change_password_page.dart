import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../layer/toast_layer.dart';
import '../widget/smart_button.dart';
import '../widget/verification_code_send_button.dart';

typedef _SendVerificationCode = Future<bool> Function(BuildContext context, String phoneOrEmail);
typedef _SubmitByOldPassword = Future<void> Function(BuildContext context, String oldPassword, String newPassword);
typedef _SubmitByVerificationCode = Future<void> Function(BuildContext context, String phoneOrEmail, String code, String newPassword);

enum _ChangePasswordMode { password, code }

class ChangePasswordPage extends StatefulWidget {
  final _SubmitByOldPassword submitByOldPassword;
  final _SendVerificationCode sendVerificationCode;
  final _SubmitByVerificationCode submitByVerificationCode;

  ChangePasswordPage({Key? key, required this.submitByOldPassword, required this.sendVerificationCode, required this.submitByVerificationCode})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late TextEditingController oldPasswordTextEditingController;
  late TextEditingController newPasswordTextEditingController;
  late TextEditingController newPassword2TextEditingController;
  late TextEditingController phoneOrEmailTextEditingController;
  late TextEditingController codeTextEditingController;
  var changePasswordMode = _ChangePasswordMode.password;

  @override
  void initState() {
    super.initState();
    oldPasswordTextEditingController = TextEditingController();
    newPasswordTextEditingController = TextEditingController();
    newPassword2TextEditingController = TextEditingController();
    phoneOrEmailTextEditingController = TextEditingController();
    codeTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("????????????"),
        actions: [
          PopupMenuButton<_ChangePasswordMode>(
            offset: Offset(0, kToolbarHeight),
            icon: Builder(
              builder: (context) {
                switch (changePasswordMode) {
                  case _ChangePasswordMode.password:
                    return Icon(Icons.password);
                  case _ChangePasswordMode.code:
                    return Icon(Icons.pin);
                }
              },
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: _ChangePasswordMode.password,
                child: Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Icon(Icons.password,
                          color: changePasswordMode == _ChangePasswordMode.password ? Theme.of(context).primaryColor : Colors.black)),
                  WidgetSpan(child: SizedBox(width: 10)),
                  TextSpan(
                      text: "?????????????????????",
                      style: TextStyle(color: changePasswordMode == _ChangePasswordMode.password ? Theme.of(context).primaryColor : Colors.black)),
                ])),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: _ChangePasswordMode.code,
                child: Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Icon(Icons.pin, color: changePasswordMode == _ChangePasswordMode.code ? Theme.of(context).primaryColor : Colors.black)),
                  WidgetSpan(child: SizedBox(width: 10)),
                  TextSpan(
                      text: "?????????????????????",
                      style: TextStyle(color: changePasswordMode == _ChangePasswordMode.code ? Theme.of(context).primaryColor : Colors.black)),
                ])),
              ),
            ],
            onSelected: (value) {
              setState(() => changePasswordMode = value);
            },
          )
        ],
      ),
      body: Focus(
        child: Builder(
          builder: (context) {
            switch (changePasswordMode) {
              case _ChangePasswordMode.password:
                return buildPasswordModeBody(context);
              case _ChangePasswordMode.code:
                return buildCodeModeBody(context);
            }
          },
        ),
      ),
    );
  }

  Widget buildPasswordModeBody(BuildContext context) => ListView(
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
                Text("????????????", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: oldPasswordTextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "??????????????????",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Row(
              children: [
                Text("????????????", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: newPasswordTextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "??????????????????",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Row(
              children: [
                Text("???????????????", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: newPassword2TextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "????????????????????????",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SmartElevatedButton(
              child: Text("??????"),
              lockedChild: Text("?????????"),
              onPressed: () async {
                Focus.of(context).unfocus();
                String oldPassword = oldPasswordTextEditingController.text.trim(),
                    newPassword = newPasswordTextEditingController.text.trim(),
                    newPassword2 = newPassword2TextEditingController.text.trim();
                if (newPassword != newPassword2) {
                  ToastLayer.show("????????????????????????");
                  return;
                }
                await widget.submitByOldPassword(context, oldPassword, newPassword);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text("???????????????6-50??????????????????"),
          ),
        ],
      );

  Widget buildCodeModeBody(BuildContext context) => ListView(
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
                Text("?????????/?????????", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: phoneOrEmailTextEditingController,
                    textAlign: TextAlign.end,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "????????????????????????????????????",
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
                      Text("????????????", style: TextStyle(fontSize: 42.sp)),
                      Expanded(
                        child: TextField(
                          controller: codeTextEditingController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.end,
                          maxLength: 8,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "??????????????????",
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
                String phoneOrEmail = phoneOrEmailTextEditingController.text.trim();
                return await widget.sendVerificationCode(context, phoneOrEmail);
              }),
              SizedBox(width: 15),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Row(
              children: [
                Text("????????????", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: newPasswordTextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "??????????????????",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Row(
              children: [
                Text("???????????????", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: newPassword2TextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "????????????????????????",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SmartElevatedButton(
              child: Text("??????"),
              lockedChild: Text("?????????"),
              onPressed: () async {
                Focus.of(context).unfocus();
                String phoneOrEmail = phoneOrEmailTextEditingController.text.trim(),
                    code = codeTextEditingController.text.trim(),
                    newPassword = newPasswordTextEditingController.text.trim(),
                    newPassword2 = newPassword2TextEditingController.text.trim();
                if (newPassword != newPassword2) {
                  ToastLayer.show("????????????????????????");
                  return;
                }
                await widget.submitByVerificationCode(context, phoneOrEmail, code, newPassword);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text("???????????????6-50??????????????????"),
          ),
        ],
      );

  @override
  void dispose() {
    oldPasswordTextEditingController.dispose();
    newPasswordTextEditingController.dispose();
    newPassword2TextEditingController.dispose();
    phoneOrEmailTextEditingController.dispose();
    codeTextEditingController.dispose();
    super.dispose();
  }
}
