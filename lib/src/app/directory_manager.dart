import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'config.dart';

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
      return Directory(p.join(_dataDir!.path, BaseConfig.subDirectory ?? "file_manager_data"));
    } else if (DirectoryType.files == directoryType) {
      return Directory(p.join(_filesDir!.path, BaseConfig.subDirectory ?? "file_manager_data"));
    } else if (DirectoryType.cache == directoryType) {
      return Directory(p.join(_cacheDir!.path, BaseConfig.subDirectory ?? "file_manager_data"));
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
