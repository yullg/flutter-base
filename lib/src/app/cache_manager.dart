import 'package:flutter_cache_manager/flutter_cache_manager.dart' as cm;

import 'base_config.dart';

class CacheManager {
  static GlobalCacheManager? _globalCacheManager;

  static Future<void> initialize() async {
    int? stalePeriod = BaseConfig.globalCacheManager_stalePeriod;
    _globalCacheManager = GlobalCacheManager(
      cacheKey: BaseConfig.globalCacheManager_cacheKey,
      stalePeriod: stalePeriod != null ? Duration(days: stalePeriod) : null,
      maxNrOfCacheObjects: BaseConfig.globalCacheManager_maxNrOfCacheObjects,
    );
  }

  static GlobalCacheManager get globalCacheManager => _globalCacheManager!;

  static Future<void> destroy() async {
    _globalCacheManager = null;
  }

  CacheManager._();
}

class GlobalCacheManager extends cm.CacheManager with cm.ImageCacheManager {
  GlobalCacheManager({String? cacheKey, Duration? stalePeriod, int? maxNrOfCacheObjects})
      : super(cm.Config(
          cacheKey ?? "global_cache_manager",
          stalePeriod: stalePeriod ?? const Duration(days: 30),
          maxNrOfCacheObjects: maxNrOfCacheObjects ?? 1000,
        ));
}
