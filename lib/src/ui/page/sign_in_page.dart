import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/package_info_manager.dart';
import '../../helper/common_field_helper.dart';
import '../smart_button.dart';

enum _SignInMode { password, phone_code, email_code }

class SignInPage extends StatefulWidget {
  final String? name;

  SignInPage({Key? key, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController nameTextEditingController;
  late TextEditingController phoneTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController phoneCodeTextEditingController;
  late TextEditingController emailCodeTextEditingController;
  _SignInMode signInMode = _SignInMode.password;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    nameTextEditingController = TextEditingController(text: widget.name);
    phoneTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    phoneCodeTextEditingController = TextEditingController();
    emailCodeTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: LimitBackWidget(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Navigator.canPop(context))
                  Padding(
                    padding: EdgeInsets.only(left: 0.1.sw),
                    child: IconButton(
                      icon: const BackButtonIcon(),
                      color: Colors.black,
                      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Expanded(child: Builder(
                                builder: (context) {
                                  switch (signInMode) {
                                    case _SignInMode.password:
                                      return buildPasswordModeWidget(context);
                                    case _SignInMode.phone_code:
                                      return buildPhoneCodeModeWidget(context);
                                    case _SignInMode.email_code:
                                      return buildEmailCodeModeWidget(context);
                                  }
                                },
                              )),
                              SizedBox(height: 20),
                              Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Divider(
                                    thickness: 1,
                                    indent: 0.1.sw,
                                    endIndent: 0.1.sw,
                                    color: Colors.grey.shade300,
                                  ),
                                  Text(
                                    "      其他登录方式      ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      backgroundColor: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  if (signInMode != _SignInMode.password)
                                    IconButton(
                                      tooltip: "账号密码登录",
                                      iconSize: 30,
                                      color: Colors.orange,
                                      icon: Icon(Icons.password),
                                      onPressed: () {
                                        setState(() => signInMode = _SignInMode.password);
                                      },
                                    ),
                                  SizedBox(width: 10),
                                  if (signInMode != _SignInMode.phone_code)
                                    IconButton(
                                      tooltip: "短信验证码登录",
                                      iconSize: 30,
                                      color: Colors.lightBlue,
                                      icon: Icon(Icons.phone_android),
                                      onPressed: () {
                                        setState(() => signInMode = _SignInMode.phone_code);
                                      },
                                    ),
                                  SizedBox(width: 10),
                                  if (signInMode != _SignInMode.email_code)
                                    IconButton(
                                      tooltip: "邮箱验证码登录",
                                      iconSize: 30,
                                      color: Colors.lightGreen,
                                      icon: Icon(Icons.mail),
                                      onPressed: () {
                                        setState(() => signInMode = _SignInMode.email_code);
                                      },
                                    ),
                                ],
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordModeWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.1.sw, right: 0.1.sw),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity),
            Text("${_greeting()}", style: TextStyle(fontSize: 60.sp)),
            Text("欢迎登录${PackageInfoManager.appName}", style: TextStyle(fontSize: 60.sp)),
            SizedBox(height: 15),
            TextFormField(
              controller: nameTextEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "请输入手机号/邮箱/账号",
                prefixIcon: Icon(Icons.person),
                counterText: "",
              ),
              validator: (value) {
                if (CommonFieldHelper.isValidPhone(value) || CommonFieldHelper.isValidEmail(value) || CommonFieldHelper.isValidUsername(value)) {
                  return null;
                }
                return "手机号/邮箱/账号格式有误";
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordTextEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
                counterText: "",
                suffixIcon: IconButton(
                  icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => obscurePassword = !obscurePassword),
                ),
              ),
              validator: (value) {
                if (CommonFieldHelper.isValidPassword(value)) {
                  return null;
                }
                return "密码格式有误";
              },
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Builder(
                builder: (context) => SmartElevatedButton(
                  child: Text("登  录"),
                  disabledChild: Text("登录中..."),
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 50.sp)),
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                  ),
                  onPressed: () async {},
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.teal),
                    overlayColor: MaterialStateProperty.all(Colors.teal[100]),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text("重置密码"),
                  onPressed: () {},
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.teal),
                    overlayColor: MaterialStateProperty.all(Colors.teal[100]),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text("注册账号"),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildPhoneCodeModeWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.1.sw, right: 0.1.sw),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity),
            Text("${_greeting()}", style: TextStyle(fontSize: 60.sp)),
            Text("欢迎登录${PackageInfoManager.appName}", style: TextStyle(fontSize: 60.sp)),
            SizedBox(height: 15),
            TextFormField(
              controller: nameTextEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "请输入手机号/邮箱/账号",
                prefixIcon: Icon(Icons.person),
                counterText: "",
              ),
              validator: (value) {
                if (CommonFieldHelper.isValidPhone(value) || CommonFieldHelper.isValidEmail(value) || CommonFieldHelper.isValidUsername(value)) {
                  return null;
                }
                return "手机号/邮箱/账号格式有误";
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordTextEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
                counterText: "",
                suffixIcon: IconButton(
                  icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => obscurePassword = !obscurePassword),
                ),
              ),
              validator: (value) {
                if (CommonFieldHelper.isValidPassword(value)) {
                  return null;
                }
                return "密码格式有误";
              },
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Builder(
                builder: (context) => SmartElevatedButton(
                  child: Text("登  录"),
                  disabledChild: Text("登录中..."),
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 50.sp)),
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                  ),
                  onPressed: () async {},
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.teal),
                    overlayColor: MaterialStateProperty.all(Colors.teal[100]),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text("重置密码"),
                  onPressed: () {},
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.teal),
                    overlayColor: MaterialStateProperty.all(Colors.teal[100]),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text("注册账号"),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildEmailCodeModeWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.1.sw, right: 0.1.sw),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity),
            Text("${_greeting()}", style: TextStyle(fontSize: 60.sp)),
            Text("欢迎登录${PackageInfoManager.appName}", style: TextStyle(fontSize: 60.sp)),
            SizedBox(height: 15),
            TextFormField(
              controller: nameTextEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "请输入手机号/邮箱/账号",
                prefixIcon: Icon(Icons.person),
                counterText: "",
              ),
              validator: (value) {
                if (CommonFieldHelper.isValidPhone(value) || CommonFieldHelper.isValidEmail(value) || CommonFieldHelper.isValidUsername(value)) {
                  return null;
                }
                return "手机号/邮箱/账号格式有误";
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordTextEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
                counterText: "",
                suffixIcon: IconButton(
                  icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => obscurePassword = !obscurePassword),
                ),
              ),
              validator: (value) {
                if (CommonFieldHelper.isValidPassword(value)) {
                  return null;
                }
                return "密码格式有误";
              },
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Builder(
                builder: (context) => SmartElevatedButton(
                  child: Text("登  录"),
                  disabledChild: Text("登录中..."),
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 50.sp)),
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                  ),
                  onPressed: () async {},
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.teal),
                    overlayColor: MaterialStateProperty.all(Colors.teal[100]),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text("重置密码"),
                  onPressed: () {},
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.teal),
                    overlayColor: MaterialStateProperty.all(Colors.teal[100]),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text("注册账号"),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameTextEditingController.dispose();
    phoneTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    phoneCodeTextEditingController.dispose();
    emailCodeTextEditingController.dispose();
    super.dispose();
  }
}

String _greeting() {
  int hour = DateTime.now().hour;
  if (5 <= hour && hour < 10) {
    return "早上好";
  } else if (10 <= hour && hour < 12) {
    return "上午好";
  } else if (12 <= hour && hour < 14) {
    return "中午好";
  } else if (14 <= hour && hour < 19) {
    return "下午好";
  } else {
    return "晚上好";
  }
}
