import 'dart:io';

import 'package:path/path.dart' as p;

import '../bean/resource.dart';
import '../helper/enum_helper.dart';
import '../helper/uuid_helper.dart';
import 'base_config.dart';
import 'directory_manager.dart';

class KeyFileManager {
  static Future<void> initialize() async {}

  static String newKey(DirectoryType directoryType, ResourceType resourceType, [String? name]) {
    return "${EnumHelper.format(directoryType)}_${name ?? UuidHelper.v4()}.${EnumHelper.format(resourceType)}";
  }

  static File file(String key) {
    var directory =
        Directory(p.join(DirectoryManager.directory(directoryType(key)).path, BaseConfig.keyFileManagerDirectory ?? "key_file_manager_data"));
    return File(p.join(directory.path, key.substring(key.indexOf("_") + 1)));
  }

  static String name(String key) {
    return key.substring(key.indexOf("_") + 1, key.lastIndexOf("."));
  }

  static ResourceType resourceType(String key) {
    return EnumHelper.parseString(ResourceType.values, key.substring(key.lastIndexOf(".") + 1))!;
  }

  static DirectoryType directoryType(String key) {
    return EnumHelper.parseString(DirectoryType.values, key.substring(0, key.indexOf("_")))!;
  }

  static Future<String> copyIn(File origFile, DirectoryType directoryType, ResourceType resourceType, [String? name]) async {
    String key = newKey(directoryType, resourceType, name);
    File destFile = file(key);
    destFile.parent.createSync(recursive: true);
    origFile.copySync(destFile.path);
    return key;
  }

  static Future<String> moveIn(File origFile, DirectoryType directoryType, ResourceType resourceType, [String? name]) async {
    String key = await copyIn(origFile, directoryType, resourceType, name);
    origFile.deleteSync();
    return key;
  }

  static Future<void> delete(String key) async {
    file(key).deleteSync();
  }

  static Future<void> destroy() async {}

  KeyFileManager._();
}
