import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

import '../app/config.dart';

class ScreenAdapterWidget extends StatelessWidget {
  final Widget Function() builder;

  ScreenAdapterWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: Size(BaseConfig.screen_width?.toDouble() ?? 360, BaseConfig.screen_height?.toDouble() ?? 690),
      allowFontScaling: BaseConfig.screen_allowFontScaling ?? false,
      builder: builder);
}
