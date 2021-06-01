import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/toast_helper.dart';
import '../smart_button.dart';
import '../verification_code_send_button.dart';

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
        title: Text("修改密码"),
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
                      text: "通过原密码修改",
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
                      text: "通过验证码重置",
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
                Text("原密码：", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: oldPasswordTextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "请输入原密码",
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
                Text("新密码：", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: newPasswordTextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "请输入新密码",
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
                Text("确认密码：", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: newPassword2TextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "请再次输入新密码",
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
              child: Text("完成"),
              lockedChild: Text("处理中"),
              onPressed: () async {
                Focus.of(context).unfocus();
                String oldPassword = oldPasswordTextEditingController.text.trim(),
                    newPassword = newPasswordTextEditingController.text.trim(),
                    newPassword2 = newPassword2TextEditingController.text.trim();
                if (newPassword != newPassword2) {
                  ToastHelper.show("新密码输入不一致");
                  return;
                }
                await widget.submitByOldPassword(context, oldPassword, newPassword);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text("密码必须是6-50位非空白字符"),
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
                Text("手机号/邮箱：", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: phoneOrEmailTextEditingController,
                    textAlign: TextAlign.end,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "请输入绑定的手机号或邮箱",
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
                Text("新密码：", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: newPasswordTextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "请输入新密码",
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
                Text("确认密码：", style: TextStyle(fontSize: 42.sp)),
                Expanded(
                  child: TextField(
                    controller: newPassword2TextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                    obscureText: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "请再次输入新密码",
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
              child: Text("完成"),
              lockedChild: Text("处理中"),
              onPressed: () async {
                Focus.of(context).unfocus();
                String phoneOrEmail = phoneOrEmailTextEditingController.text.trim(),
                    code = codeTextEditingController.text.trim(),
                    newPassword = newPasswordTextEditingController.text.trim(),
                    newPassword2 = newPassword2TextEditingController.text.trim();
                if (newPassword != newPassword2) {
                  ToastHelper.show("新密码输入不一致");
                  return;
                }
                await widget.submitByVerificationCode(context, phoneOrEmail, code, newPassword);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text("密码必须是6-50位非空白字符"),
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
