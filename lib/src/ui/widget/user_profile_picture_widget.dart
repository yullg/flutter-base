import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app/cache_manager.dart';
import '../../helper/uri_helper.dart';

class UserProfilePictureWidget extends StatelessWidget {
  final String? src;
  final double diameter;
  final Color borderColor;
  final double borderWidth;

  const UserProfilePictureWidget(
    this.src, {
    Key? key,
    this.diameter = 70,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipOval(
        child: src != null
            ? CachedNetworkImage(
                imageUrl: src!,
                fit: BoxFit.cover,
                cacheManager: CacheManager.globalCacheManager,
                cacheKey: UriHelper.baseUri(Uri.parse(src!)).toString(),
              )
            : Image.asset("assets/image/user_profile_picture.webp", package: "base", fit: BoxFit.cover),
      ),
    );
  }
}
