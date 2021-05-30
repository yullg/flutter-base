import 'package:flutter/material.dart';

enum _SignInMode { password, code }

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController nameTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController codeTextEditingController;
  var signInMode = _SignInMode.password;

  @override
  void initState() {
    super.initState();
    passwordTextEditingController = TextEditingController();
    nameTextEditingController = TextEditingController();
    codeTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void dispose() {
    passwordTextEditingController.dispose();
    nameTextEditingController.dispose();
    codeTextEditingController.dispose();
    super.dispose();
  }
}
