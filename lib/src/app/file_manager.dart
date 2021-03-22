import 'dart:io';

import 'package:base/base.dart';
import 'package:path/path.dart' as p;

import '../helper/enum_helper.dart';
import '../helper/uuid_helper.dart';
import 'directory_manager.dart';

enum FileType { text, image, video, audio, application, unknown }

class FileManager {
  static Future<void> initialize() async {}

  static String newKey(DirectoryType directoryType, FileType fileType, [String? name]) {
    return "${EnumHelper.format(directoryType)}_${name ?? UuidHelper.v4()}.${EnumHelper.format(fileType)}";
  }

  static File keyToFile(String key) {
    return File(p.join(DirectoryManager.directory(directoryType(key)).path, key.substring(key.indexOf("_") + 1)));
  }

  static Future<String> copyIn(File file, DirectoryType directoryType, FileType fileType, [String? name]) async {
    String key = newKey(directoryType, fileType, name);
    File destFile = keyToFile(key);
    destFile.parent.createSync(recursive: true);
    file.copySync(destFile.path);
    return key;
  }

  static Future<String> moveIn(File file, DirectoryType directoryType, FileType fileType, [String? name]) async {
    String key = await copyIn(file, directoryType, fileType, name);
    file.deleteSync();
    return key;
  }

  static DirectoryType directoryType(String key) {
    return EnumHelper.parseString(DirectoryType.values, key.substring(0, key.indexOf("_")))!;
  }

  static FileType fileType(String key) {
    return EnumHelper.parseString(FileType.values, key.substring(key.lastIndexOf(".") + 1))!;
  }

  static Future<void> destroy() async {}

  FileManager._();
}

FileType getFileTypeFromFile(File file) {
  return getFileTypeFromMimeType(MimeTypeHelper.getMimeTypeFromFile(file));
}

FileType getFileTypeFromMimeType(String? mimeType) {
  var result = FileType.unknown;
  if (mimeType != null) {
    if (mimeType.startsWith('text/')) {
      result = FileType.text;
    } else if (mimeType.startsWith('image/')) {
      result = FileType.image;
    } else if (mimeType.startsWith('video/')) {
      result = FileType.video;
    } else if (mimeType.startsWith('audio/')) {
      result = FileType.audio;
    } else if (mimeType.startsWith('application/')) {
      result = FileType.application;
    }
  }
  return result;
}
