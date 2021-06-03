import 'package:flutter/material.dart';

class InfiniteRotatingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  InfiniteRotatingWidget({Key? key, required this.child, this.duration = const Duration(milliseconds: 500), this.curve = Curves.linear})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _InfiniteRotatingWidgetState();
}

class _InfiniteRotatingWidgetState extends State<InfiniteRotatingWidget> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this)..repeat();
    animation = CurvedAnimation(parent: controller, curve: widget.curve);
  }

  @override
  Widget build(BuildContext context) => RotationTransition(turns: animation, child: widget.child);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
