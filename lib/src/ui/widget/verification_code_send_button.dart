import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'smart_button.dart';

class VerificationCodeSendElevatedButton extends _VerificationCodeSendButton {
  VerificationCodeSendElevatedButton({Key? key, String? name, int? interval, required AsyncValueGetter<bool> onPressed})
      : super(key: key, name: name, interval: interval, onPressed: onPressed);

  @override
  State<StatefulWidget> createState() => _VerificationCodeSendElevatedButtonState();
}

class _VerificationCodeSendElevatedButtonState extends _VerificationCodeSendButtonState<VerificationCodeSendElevatedButton> {
  @override
  Widget build(BuildContext context) => SmartElevatedButton(
        child: newButtonChild(context),
        lockedChild: newButtonLockedChild(context),
        onPressed: newButtonOnPressed(context),
      );
}

class VerificationCodeSendOutlinedButton extends _VerificationCodeSendButton {
  VerificationCodeSendOutlinedButton({Key? key, String? name, int? interval, required AsyncValueGetter<bool> onPressed})
      : super(key: key, name: name, interval: interval, onPressed: onPressed);

  @override
  State<StatefulWidget> createState() => _VerificationCodeSendOutlinedButtonState();
}

class _VerificationCodeSendOutlinedButtonState extends _VerificationCodeSendButtonState<VerificationCodeSendOutlinedButton> {
  @override
  Widget build(BuildContext context) => SmartOutlinedButton(
        child: newButtonChild(context),
        lockedChild: newButtonLockedChild(context),
        onPressed: newButtonOnPressed(context),
      );
}

class VerificationCodeSendTextButton extends _VerificationCodeSendButton {
  VerificationCodeSendTextButton({Key? key, String? name, int? interval, required AsyncValueGetter<bool> onPressed})
      : super(key: key, name: name, interval: interval, onPressed: onPressed);

  @override
  State<StatefulWidget> createState() => _VerificationCodeSendTextButtonState();
}

class _VerificationCodeSendTextButtonState extends _VerificationCodeSendButtonState<VerificationCodeSendTextButton> {
  @override
  Widget build(BuildContext context) => SmartTextButton(
        child: newButtonChild(context),
        lockedChild: newButtonLockedChild(context),
        onPressed: newButtonOnPressed(context),
      );
}

final _nextEnableTimes = <String, DateTime>{};

int? _lockSeconds(String name) {
  DateTime? nextEnableTime = _nextEnableTimes[name];
  if (nextEnableTime != null) {
    int seconds = nextEnableTime.difference(DateTime.now()).inSeconds;
    if (seconds > 0) {
      return seconds;
    } else {
      _nextEnableTimes.remove(name);
    }
  }
  return null;
}

abstract class _VerificationCodeSendButton extends StatefulWidget {
  final String name;
  final int interval;
  final AsyncValueGetter<bool> onPressed;

  _VerificationCodeSendButton({Key? key, String? name, int? interval, required this.onPressed})
      : this.name = name ?? "DEFAULT",
        this.interval = interval ?? 60,
        super(key: key);
}

abstract class _VerificationCodeSendButtonState<T extends _VerificationCodeSendButton> extends State<T> {
  late Timer timer;
  int? lockSeconds;

  @override
  void initState() {
    super.initState();
    lockSeconds = _lockSeconds(widget.name);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var tempLockSeconds = _lockSeconds(widget.name);
      if (lockSeconds != tempLockSeconds) {
        setState(() => lockSeconds = tempLockSeconds);
      }
    });
  }

  Widget newButtonChild(BuildContext context) => Text(lockSeconds == null ? "获取验证码" : "$lockSeconds秒后重新获取");

  Widget newButtonLockedChild(BuildContext context) => Text("处理中");

  AsyncCallback? newButtonOnPressed(BuildContext context) => lockSeconds == null
      ? () async {
          await widget.onPressed().then((value) {
            if (value) {
              _nextEnableTimes[widget.name] = DateTime.now().add(Duration(seconds: widget.interval));
            }
          }).whenComplete(() {
            if (mounted) {
              var tempLockSeconds = _lockSeconds(widget.name);
              if (lockSeconds != tempLockSeconds) {
                setState(() => lockSeconds = tempLockSeconds);
              }
            }
          });
        }
      : null;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
