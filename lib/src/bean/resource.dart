import 'dart:io';

import '../app/key_file_manager.dart';
import '../helper/mime_type_helper.dart';

enum ResourceType { text, image, video, audio, application, unknown }

class Resource<T> {
  final ResourceType type;
  final T data;

  Resource(this.type, this.data);
}

class FileResource extends Resource<File> {
  FileResource(ResourceType type, File file) : super(type, file);

  FileResource.fromFile(File file) : super(MimeTypeHelper.getResourceTypeFromFile(file), file);
}

class KeyFileResource extends FileResource {
  final String key;

  KeyFileResource(this.key) : super(KeyFileManager.resourceType(key), KeyFileManager.file(key));
}

class UriResource extends Resource<Uri> {
  UriResource(ResourceType type, Uri uri) : super(type, uri);

  UriResource.fromUri(Uri uri) : super(MimeTypeHelper.getResourceTypeFromUri(uri), uri);
}
