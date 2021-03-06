import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../app/package_info_manager.dart';
import '../widget/limit_exit_widget.dart';
import '../widget/smart_button.dart';
import '../widget/verification_code_send_button.dart';

typedef _SignInByPassword = Future<void> Function(BuildContext context, String name, String password);
typedef _SignInByPhoneCode = Future<void> Function(BuildContext context, String phone, String code);
typedef _SignInByEmailCode = Future<void> Function(BuildContext context, String email, String code);
typedef _SignUp = Future<void> Function(BuildContext context, String phone, String code, String password);
typedef _ResetPassword = Future<void> Function(BuildContext context, String phoneOrEmail, String code, String password);
typedef _SendVerificationCode = Future<bool> Function(BuildContext context, AuthenticatePageMode mode, String phoneOrEmail);

enum AuthenticatePageMode { password, phone_code, email_code, sign_up, reset_password }

class AuthenticatePageController extends ChangeNotifier {
  AuthenticatePageMode _authenticatePageMode;
  bool _obscurePassword;

  AuthenticatePageController({AuthenticatePageMode mode = AuthenticatePageMode.password, bool obscurePassword = true})
      : _authenticatePageMode = mode,
        _obscurePassword = obscurePassword;

  AuthenticatePageMode get authenticatePageMode => _authenticatePageMode;

  set authenticatePageMode(AuthenticatePageMode value) {
    _authenticatePageMode = value;
    notifyListeners();
  }

  bool get obscurePassword => _obscurePassword;

  set obscurePassword(bool value) {
    _obscurePassword = value;
    notifyListeners();
  }
}

class AuthenticatePage extends StatefulWidget {
  final AuthenticatePageController? controller;
  final _SignInByPassword signInByPassword;
  final _SignInByPhoneCode signInByPhoneCode;
  final _SignInByEmailCode signInByEmailCode;
  final _SignUp signUp;
  final _ResetPassword resetPassword;
  final _SendVerificationCode sendVerificationCode;

  AuthenticatePage(
      {Key? key,
      this.controller,
      required this.signInByPassword,
      required this.signInByPhoneCode,
      required this.signInByEmailCode,
      required this.signUp,
      required this.resetPassword,
      required this.sendVerificationCode})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  late final AuthenticatePageController defaultController;
  late final TextEditingController nameTextEditingController;
  late final TextEditingController codeTextEditingController;
  late final TextEditingController passwordTextEditingController;

  @override
  void initState() {
    super.initState();
    defaultController = AuthenticatePageController();
    nameTextEditingController = TextEditingController();
    codeTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LimitExitWidget(
          child: SafeArea(
            child: Focus(
              child: ChangeNotifierProvider.value(
                value: widget.controller ?? defaultController,
                child: Consumer<AuthenticatePageController>(
                  builder: (_, notifier, child) => Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15),
                          if (Navigator.canPop(context)) BackButton(),
                        ],
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
                                    SizedBox(height: 30),
                                    Expanded(child: Builder(
                                      builder: (context) {
                                        switch (notifier.authenticatePageMode) {
                                          case AuthenticatePageMode.password:
                                            return buildPasswordModeWidget(context, notifier);
                                          case AuthenticatePageMode.phone_code:
                                            return buildPhoneCodeModeWidget(context, notifier);
                                          case AuthenticatePageMode.email_code:
                                            return buildEmailCodeModeWidget(context, notifier);
                                          case AuthenticatePageMode.reset_password:
                                            return buildResetPasswordModeWidget(context, notifier);
                                          case AuthenticatePageMode.sign_up:
                                            return buildSignUpModeWidget(context, notifier);
                                        }
                                      },
                                    )),
                                    SizedBox(height: 20),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Divider(thickness: 1, indent: 0.1.sw, endIndent: 0.1.sw, color: Colors.grey.shade300),
                                        Text("      ??????????????????      ", style: TextStyle(color: Colors.grey, backgroundColor: Colors.white))
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        if (notifier.authenticatePageMode != AuthenticatePageMode.password)
                                          TextButton(
                                            child: Icon(Icons.password),
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                                shape: MaterialStateProperty.all(CircleBorder())),
                                            onPressed: () {
                                              Focus.of(context).unfocus();
                                              notifier.authenticatePageMode = AuthenticatePageMode.password;
                                            },
                                          ),
                                        SizedBox(width: 10),
                                        if (notifier.authenticatePageMode != AuthenticatePageMode.phone_code)
                                          TextButton(
                                            child: Icon(Icons.phone_android),
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                                shape: MaterialStateProperty.all(CircleBorder())),
                                            onPressed: () {
                                              Focus.of(context).unfocus();
                                              notifier.authenticatePageMode = AuthenticatePageMode.phone_code;
                                            },
                                          ),
                                        SizedBox(width: 10),
                                        if (notifier.authenticatePageMode != AuthenticatePageMode.email_code)
                                          TextButton(
                                            child: Icon(Icons.mail),
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                                shape: MaterialStateProperty.all(CircleBorder())),
                                            onPressed: () {
                                              Focus.of(context).unfocus();
                                              notifier.authenticatePageMode = AuthenticatePageMode.email_code;
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
          ),
        ),
      ),
    );
  }

  Widget buildPasswordModeWidget(BuildContext context, AuthenticatePageController notifier) {
    return Padding(
      padding: EdgeInsets.only(left: 0.1.sw, right: 0.1.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity),
          Text("????????????${PackageInfoManager.appName}", style: TextStyle(fontSize: 60.sp)),
          SizedBox(height: 15),
          TextField(
            controller: nameTextEditingController,
            maxLength: 100,
            decoration: InputDecoration(
              hintText: "??????????????????/??????/??????",
              prefixIcon: Icon(Icons.person),
              counterText: "",
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: passwordTextEditingController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: notifier.obscurePassword,
            maxLength: 50,
            decoration: InputDecoration(
              hintText: "???????????????",
              prefixIcon: Icon(Icons.lock),
              counterText: "",
              suffixIcon: IconButton(
                icon: Icon(notifier.obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  notifier.obscurePassword = !notifier.obscurePassword;
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: SmartElevatedButton(
              child: Text("???\u3000???"),
              lockedChild: Text("?????????..."),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 50.sp)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () async {
                Focus.of(context).unfocus();
                String name = nameTextEditingController.text.trim(), password = passwordTextEditingController.text.trim();
                await widget.signInByPassword(context, name, password);
              },
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.reset_password;
                },
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.sign_up;
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildPhoneCodeModeWidget(BuildContext context, AuthenticatePageController notifier) {
    return Padding(
      padding: EdgeInsets.only(left: 0.1.sw, right: 0.1.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity),
          Text("????????????${PackageInfoManager.appName}", style: TextStyle(fontSize: 60.sp)),
          SizedBox(height: 15),
          TextField(
            controller: nameTextEditingController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: InputDecoration(
              hintText: "??????????????????",
              prefixIcon: Icon(Icons.phone_android),
              counterText: "",
            ),
          ),
          SizedBox(height: 10),
          Stack(
            children: <Widget>[
              TextField(
                controller: codeTextEditingController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                  hintText: "??????????????????",
                  prefixIcon: Icon(Icons.pin),
                  counterText: "",
                ),
              ),
              Positioned(
                right: 0,
                child: VerificationCodeSendOutlinedButton(onPressed: () async {
                  String phone = nameTextEditingController.text.trim();
                  return await widget.sendVerificationCode(context, AuthenticatePageMode.phone_code, phone);
                }),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: SmartElevatedButton(
              child: Text("???\u3000???"),
              lockedChild: Text("?????????..."),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 50.sp)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () async {
                Focus.of(context).unfocus();
                String phone = nameTextEditingController.text.trim(), code = codeTextEditingController.text.trim();
                await widget.signInByPhoneCode(context, phone, code);
              },
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.reset_password;
                },
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.sign_up;
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildEmailCodeModeWidget(BuildContext context, AuthenticatePageController notifier) {
    return Padding(
      padding: EdgeInsets.only(left: 0.1.sw, right: 0.1.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity),
          Text("????????????${PackageInfoManager.appName}", style: TextStyle(fontSize: 60.sp)),
          SizedBox(height: 15),
          TextField(
            controller: nameTextEditingController,
            keyboardType: TextInputType.emailAddress,
            maxLength: 100,
            decoration: InputDecoration(
              hintText: "???????????????",
              prefixIcon: Icon(Icons.email),
              counterText: "",
            ),
          ),
          SizedBox(height: 10),
          Stack(
            children: <Widget>[
              TextField(
                controller: codeTextEditingController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                  hintText: "??????????????????",
                  prefixIcon: Icon(Icons.pin),
                  counterText: "",
                ),
              ),
              Positioned(
                right: 0,
                child: VerificationCodeSendOutlinedButton(onPressed: () async {
                  String email = nameTextEditingController.text.trim();
                  return await widget.sendVerificationCode(context, AuthenticatePageMode.email_code, email);
                }),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: SmartElevatedButton(
              child: Text("???\u3000???"),
              lockedChild: Text("?????????..."),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 50.sp)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () async {
                Focus.of(context).unfocus();
                String email = nameTextEditingController.text.trim(), code = codeTextEditingController.text.trim();
                await widget.signInByEmailCode(context, email, code);
              },
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.reset_password;
                },
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.sign_up;
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildResetPasswordModeWidget(BuildContext context, AuthenticatePageController notifier) {
    return Padding(
      padding: EdgeInsets.only(left: 0.1.sw, right: 0.1.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity),
          Text("????????????", style: TextStyle(fontSize: 60.sp)),
          SizedBox(height: 15),
          TextField(
            controller: nameTextEditingController,
            maxLength: 100,
            decoration: InputDecoration(
              hintText: "??????????????????/??????",
              prefixIcon: Icon(Icons.person),
              counterText: "",
            ),
          ),
          SizedBox(height: 10),
          Stack(
            children: <Widget>[
              TextField(
                controller: codeTextEditingController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                  hintText: "??????????????????",
                  prefixIcon: Icon(Icons.pin),
                  counterText: "",
                ),
              ),
              Positioned(
                right: 0,
                child: VerificationCodeSendOutlinedButton(onPressed: () async {
                  String phoneOrEmail = nameTextEditingController.text.trim();
                  return await widget.sendVerificationCode(context, AuthenticatePageMode.reset_password, phoneOrEmail);
                }),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextField(
            controller: passwordTextEditingController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: notifier.obscurePassword,
            maxLength: 50,
            decoration: InputDecoration(
              hintText: "???????????????",
              prefixIcon: Icon(Icons.lock),
              counterText: "",
              suffixIcon: IconButton(
                icon: Icon(notifier.obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => notifier.obscurePassword = !notifier.obscurePassword,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: SmartElevatedButton(
              child: Text("???\u3000???"),
              lockedChild: Text("?????????..."),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 50.sp)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () async {
                Focus.of(context).unfocus();
                String name = nameTextEditingController.text.trim(),
                    code = codeTextEditingController.text.trim(),
                    password = passwordTextEditingController.text.trim();
                await widget.resetPassword(context, name, code, password);
              },
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.password;
                },
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.sign_up;
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSignUpModeWidget(BuildContext context, AuthenticatePageController notifier) {
    return Padding(
      padding: EdgeInsets.only(left: 0.1.sw, right: 0.1.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity),
          Text("????????????", style: TextStyle(fontSize: 60.sp)),
          SizedBox(height: 15),
          TextField(
            controller: nameTextEditingController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: InputDecoration(
              hintText: "??????????????????",
              prefixIcon: Icon(Icons.phone_android),
              counterText: "",
            ),
          ),
          SizedBox(height: 10),
          Stack(
            children: <Widget>[
              TextField(
                controller: codeTextEditingController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                  hintText: "??????????????????",
                  prefixIcon: Icon(Icons.pin),
                  counterText: "",
                ),
              ),
              Positioned(
                right: 0,
                child: VerificationCodeSendOutlinedButton(onPressed: () async {
                  String phone = nameTextEditingController.text.trim();
                  return await widget.sendVerificationCode(context, AuthenticatePageMode.sign_up, phone);
                }),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextField(
            controller: passwordTextEditingController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: notifier.obscurePassword,
            maxLength: 50,
            decoration: InputDecoration(
              hintText: "???????????????",
              prefixIcon: Icon(Icons.lock),
              counterText: "",
              suffixIcon: IconButton(
                icon: Icon(notifier.obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => notifier.obscurePassword = !notifier.obscurePassword,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: SmartElevatedButton(
              child: Text("???\u3000???"),
              lockedChild: Text("?????????..."),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 50.sp)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () async {
                Focus.of(context).unfocus();
                String name = nameTextEditingController.text.trim(),
                    code = codeTextEditingController.text.trim(),
                    password = passwordTextEditingController.text.trim();
                await widget.signUp(context, name, code, password);
              },
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.reset_password;
                },
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("????????????"),
                onPressed: () {
                  Focus.of(context).unfocus();
                  notifier.authenticatePageMode = AuthenticatePageMode.password;
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    defaultController.dispose();
    nameTextEditingController.dispose();
    codeTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }
}
