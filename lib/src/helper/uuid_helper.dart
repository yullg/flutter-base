import 'package:uuid/uuid.dart';

class UuidHelper {
  static final _uuid = Uuid();

  static String v1({Map<String, dynamic>? options}) => _uuid.v1(options: options);

  static String v4({Map<String, dynamic>? options}) => _uuid.v4(options: options);

  UuidHelper._();
}
