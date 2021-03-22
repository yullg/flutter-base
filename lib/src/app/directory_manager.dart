import 'dart:io';

import 'package:path_provider/path_provider.dart';

enum DirectoryType { data, files, cache }

class DirectoryManager {
  static Directory? _dataDir;
  static Directory? _filesDir;
  static Directory? _cacheDir;

  static Future<void> initialize() async {
    _dataDir = await getApplicationDocumentsDirectory();
    _filesDir = await getApplicationSupportDirectory();
    _cacheDir = await getTemporaryDirectory();
  }

  static Directory get dataDir => _dataDir!;

  static Directory get filesDir => _filesDir!;

  static Directory get cacheDir => _cacheDir!;

  static Directory directory(DirectoryType directoryType) {
    if (DirectoryType.data == directoryType) {
      return dataDir;
    } else if (DirectoryType.files == directoryType) {
      return filesDir;
    } else if (DirectoryType.cache == directoryType) {
      return cacheDir;
    }
    throw UnsupportedError("[ directoryType = $directoryType ]");
  }

  static Future<void> destroy() async {
    _dataDir = null;
    _filesDir = null;
    _cacheDir = null;
  }

  DirectoryManager._();
}
