import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../app/cache_manager.dart';
import '../../bean/resource.dart';
import '../../helper/uri_helper.dart';
import 'image_widget.dart';
import 'video_widget.dart';

class MediaResourceWidget extends StatelessWidget {
  final Resource resource;
  final WidgetBuilder unsupportedWidgetBuilder;

  MediaResourceWidget(this.resource, {Key? key, this.unsupportedWidgetBuilder = _defaultUnsupportedWidgetBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (resource is FileResource) {
      if (ResourceType.image == resource.type) {
        return ImageWidget(
          imageProvider: FileImage(resource.data),
        );
      } else if (ResourceType.video == resource.type) {
        return VideoWidget(
          controllerBuilder: () => VideoPlayerController.file(resource.data),
        );
      }
    } else if (resource is UriResource) {
      if (ResourceType.image == resource.type) {
        return ImageWidget(
          imageProvider: CachedNetworkImageProvider(
            resource.data.toString(),
            cacheManager: CacheManager.globalCacheManager,
            cacheKey: UriHelper.baseUri(resource.data).toString(),
          ),
        );
      } else if (ResourceType.video == resource.type) {
        return VideoWidget(
          controllerBuilder: () => VideoPlayerController.network(resource.data.toString()),
        );
      }
    }
    return unsupportedWidgetBuilder(context);
  }
}

Widget _defaultUnsupportedWidgetBuilder(BuildContext context) => Container(
      alignment: Alignment.center,
      child: Text("格式不支持", style: TextStyle(color: Colors.white)),
    );
