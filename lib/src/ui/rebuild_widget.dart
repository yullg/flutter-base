import 'package:flutter/material.dart';

class RebuildNotification extends Notification {
  const RebuildNotification();
}

class RebuildWidget<T extends RebuildNotification> extends StatefulWidget {
  final ValueWidgetBuilder<T?> builder;
  final bool intercept;

  RebuildWidget({Key? key, required this.builder, this.intercept = true}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RebuildWidgetState<T>();
}

class _RebuildWidgetState<T extends RebuildNotification> extends State<RebuildWidget<T>> {
  T? notification;

  @override
  Widget build(BuildContext context) => NotificationListener<T>(
        child: widget.builder(context, notification, null),
        onNotification: (notification) {
          this.notification = notification;
          if (mounted) setState(() {});
          return widget.intercept;
        },
      );
}
