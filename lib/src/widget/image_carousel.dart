import 'dart:async';

import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatefulWidget {
  final List<ImageProvider<Object>> images;
  final int initialIndex;
  final Duration duration;
  final BoxFit fit;

  ImageCarouselWidget(
      {Key? key,
      required this.images,
      this.initialIndex = 0,
      this.duration = const Duration(seconds: 60),
      this.fit = BoxFit.cover})
      : super(key: key);

  @override
  State createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  late int index;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
    timer = Timer.periodic(widget.duration, (timer) {
      if (mounted) {
        setState(() {
          if (index + 1 < widget.images.length) {
            index = index + 1;
          } else {
            index = 0;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Image(key: ValueKey(index), image: widget.images[index], fit: widget.fit),
      );

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
