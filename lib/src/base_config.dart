class BaseConfig {
  final String? keyFileManagerDirectory;
  final String? globalCacheManager_cacheKey;
  final int? globalCacheManager_stalePeriod;
  final int? globalCacheManager_maxNrOfCacheObjects;
  final bool? logger_consoleEnabled;
  final int? logger_consoleLevel;
  final bool? logger_fileEnabled;
  final int? logger_fileLevel;

  BaseConfig(
      {this.keyFileManagerDirectory,
      this.globalCacheManager_cacheKey,
      this.globalCacheManager_stalePeriod,
      this.globalCacheManager_maxNrOfCacheObjects,
      this.logger_consoleEnabled,
      this.logger_consoleLevel,
      this.logger_fileEnabled,
      this.logger_fileLevel});

  BaseConfig.map(Map<String, dynamic>? map)
      : this.keyFileManagerDirectory = map?["keyFileManagerDirectory"],
        this.globalCacheManager_cacheKey = map?["globalCacheManager"]?["cacheKey"],
        this.globalCacheManager_stalePeriod = map?["globalCacheManager"]?["stalePeriod"],
        this.globalCacheManager_maxNrOfCacheObjects = map?["globalCacheManager"]?["maxNrOfCacheObjects"],
        this.logger_consoleEnabled = map?["logger"]?["consoleEnabled"],
        this.logger_consoleLevel = map?["logger"]?["consoleLevel"],
        this.logger_fileEnabled = map?["logger"]?["fileEnabled"],
        this.logger_fileLevel = map?["logger"]?["fileLevel"];

  static BaseConfig get defaultInstance => BaseConfig();
}
