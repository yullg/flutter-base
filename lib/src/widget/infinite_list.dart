import 'package:flutter/material.dart';

class InfiniteListWidget extends StatefulWidget {
  final InfiniteListOption option;

  InfiniteListWidget({Key? key, required this.option}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InfiniteListWidgetState();
}

class _InfiniteListWidgetState extends State<InfiniteListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = ListView();
    if (null != widget.option.onRefresh) {
      return RefreshIndicator(
        onRefresh: widget.option.onRefresh!,
        child: ListView(),
      );
    } else {
      return child;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class InfiniteListOption {
  final RefreshCallback? onRefresh;

  InfiniteListOption({this.onRefresh});
}
