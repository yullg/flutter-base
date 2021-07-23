import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageWidget extends StatelessWidget {
  final ImageProvider<Object> imageProvider;
  final BoxDecoration backgroundDecoration;
  final LoadingBuilder loadingBuilder;
  final ImageErrorWidgetBuilder errorBuilder;
  final double initialScale;
  final double maxScale;
  final double minScale;

  ImageWidget(
      {Key? key,
      required this.imageProvider,
      this.backgroundDecoration = _defaultBackgroundDecoration,
      this.loadingBuilder = _defaultLoadingBuilder,
      this.errorBuilder = _defaultErrorBuilder,
      this.initialScale = 1,
      this.maxScale = 5,
      this.minScale = 0.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) => PhotoView(
        imageProvider: imageProvider,
        backgroundDecoration: backgroundDecoration,
        loadingBuilder: loadingBuilder,
        errorBuilder: errorBuilder,
        initialScale: PhotoViewComputedScale.contained * initialScale,
        maxScale: PhotoViewComputedScale.contained * maxScale,
        minScale: PhotoViewComputedScale.contained * minScale,
      );
}

const BoxDecoration _defaultBackgroundDecoration = BoxDecoration(color: Colors.black);

Widget _defaultLoadingBuilder(BuildContext context, ImageChunkEvent? event) {
  int? cumulativeBytesLoaded = event?.cumulativeBytesLoaded, expectedTotalBytes = event?.expectedTotalBytes;
  return Center(
    child: CircularProgressIndicator(
      value: cumulativeBytesLoaded == null || expectedTotalBytes == null ? null : cumulativeBytesLoaded / expectedTotalBytes,
    ),
  );
}

Widget _defaultErrorBuilder(BuildContext context, Object error, StackTrace? stackTrace) {
  return Center(
    child: Icon(Icons.broken_image, color: Colors.grey.shade400, size: 45),
  );
}
