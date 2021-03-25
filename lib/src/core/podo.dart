class Podo {
  final Map<String, dynamic> _map;

  Podo() : _map = {};

  Podo.of(Map<String, dynamic> map) : _map = Map.of(map);

  Iterable<MapEntry<String, dynamic>> get attributes => _map.entries;

  bool get isEmpty => _map.isEmpty;

  bool get isNotEmpty => _map.isNotEmpty;

  int get length => _map.length;

  Iterable<String> get names => _map.keys;

  Iterable<dynamic> get values => _map.values;

  dynamic get(String name) => _map[name];

  void set(String name, dynamic value) => _map[name] = value;

  Podo clone() => Podo.of(_map);

  @override
  bool operator ==(Object other) {
    bool? result;
    if (identical(this, other)) {
      result = true;
    } else if (other is Podo && runtimeType == other.runtimeType && length == other.length) {
      for (var entry in _map.entries) {
        if (entry.value != other.get(entry.key)) {
          result = false;
          break;
        }
      }
      result ??= true;
    }
    return result ?? false;
  }

  @override
  int get hashCode {
    int result = 0;
    _map.forEach((key, value) {
      result ^= key.hashCode;
      result ^= value.hashCode;
    });
    return result;
  }

  @override
  String toString() {
    return 'Podo $_map';
  }
}
