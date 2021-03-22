import 'package:base/base.dart';
import 'package:flutter/widgets.dart';

import '../app/config.dart';

class ScreenAdapterWidget extends StatelessWidget {
  final Widget Function() builder;

  ScreenAdapterWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: (BaseConfig.screen_width != null && BaseConfig.screen_height != null)
          ? Size(BaseConfig.screen_width!.toDouble(), BaseConfig.screen_height!.toDouble())
          : ScreenUtil.defaultSize,
      allowFontScaling: BaseConfig.screen_allowFontScaling ?? false,
      builder: builder);
}
