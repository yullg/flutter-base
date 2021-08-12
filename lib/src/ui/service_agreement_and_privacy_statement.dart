import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app/shared_preferences_manager.dart';
import '../core/base_logger.dart';

Future<bool> agreeServiceAgreementAndPrivacyStatement(
        {required BuildContext context,
        String name = "agreeServiceAgreementAndPrivacyStatement",
        required void Function() onServiceAgreementClick,
        required void Function() onPrivacyStatementClick}) =>
    Future.microtask(() async {
      if (SharedPreferenceManager.instance.getBool(name) ?? false) {
        return true;
      } else {
        return (await showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (context) => WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  title: Text("服务协议和隐私声明", textAlign: TextAlign.center),
                  content: Text.rich(TextSpan(
                      text: '请您务必审慎阅读、充分理解“服务协议”和“隐私声明”各条款，包括但不限于为了给您提供服务和保障账号安全，'
                          '我们会申请相关权限。您可以在“设置”中查看、变更、删除个人信息并管理您的授权。\n'
                          '您可阅读',
                      children: [
                        TextSpan(
                          text: "《服务协议》",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = onServiceAgreementClick,
                        ),
                        TextSpan(text: "和"),
                        TextSpan(
                          text: "《隐私声明》",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = onPrivacyStatementClick,
                        ),
                        TextSpan(text: "了解详细信息。如您同意，请点击“同意”开始接受我们的服务。"),
                      ])),
                  actions: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
                      ),
                      child: Text("暂不使用"),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                      ),
                      child: Text("同意"),
                      onPressed: () {
                        SharedPreferenceManager.instance.setBool(name, true).catchError((e, s) {
                          BaseLogger.error("Unable to save '$name'", e, s);
                        }).whenComplete(() {
                          Navigator.pop(context, true);
                        });
                      },
                    ),
                  ],
                ),
              ),
            )) ??
            false;
      }
    });
