import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

enum DirectoryType { data, files, cache }

class DirectoryManager {
  static Directory? _dataDir;
  static Directory? _filesDir;
  static Directory? _cacheDir;
  static Directory? _androidExternalFilesDir;
  static Directory? _androidExternalCacheDir;

  static Future<void> initialize() async {
    _dataDir = await getApplicationDocumentsDirectory();
    _filesDir = await getApplicationSupportDirectory();
    _cacheDir = await getTemporaryDirectory();
    if (Platform.isAndroid) {
      _androidExternalFilesDir = await getExternalStorageDirectory();
      var externalCacheDirectories = await getExternalCacheDirectories();
      if (externalCacheDirectories != null && externalCacheDirectories.isNotEmpty) {
        _androidExternalCacheDir = externalCacheDirectories.first;
      }
    }
  }

  static Directory get dataDir => _dataDir!;

  static Directory get filesDir => _filesDir!;

  static Directory get cacheDir => _cacheDir!;

  static Directory? get androidExternalFilesDir => _androidExternalFilesDir;

  static Directory? get androidExternalCacheDir => _androidExternalCacheDir;

  static Directory directory(DirectoryType directoryType) {
    switch (directoryType) {
      case DirectoryType.data:
        return dataDir;
      case DirectoryType.files:
        return filesDir;
      case DirectoryType.cache:
        return cacheDir;
    }
  }

  static Directory joinDirectory(Directory directory, [String? part1, String? part2, String? part3]) {
    return Directory(p.join(directory.path, part1, part2, part3));
  }

  static Future<void> destroy() async {
    _dataDir = null;
    _filesDir = null;
    _cacheDir = null;
    _androidExternalFilesDir = null;
    _androidExternalCacheDir = null;
  }

  DirectoryManager._();
}
