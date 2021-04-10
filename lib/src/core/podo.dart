const EMPTY_PODO = Podo._({});

class Podo {
  final Map<String, dynamic> _map;

  const Podo._(Map<String, dynamic> map) : _map = map;

  Podo() : this._({});

  Podo.clone(Podo podo) : this._(Map.of(podo._map));

  Podo.of(Map<String, dynamic> map) : this._(Map.of(map));

  bool get isEmpty => _map.isEmpty;

  bool get isNotEmpty => _map.isNotEmpty;

  int get length => _map.length;

  Iterable<String> get names => _map.keys;

  Iterable<dynamic> get values => _map.values;

  bool containsName(String name) => _map.containsKey(name);

  void remove(String name) => _map.remove(name);

  dynamic get(String name) => _map[name];

  void set(String name, dynamic value) => _map[name] = value;

  Map<String, dynamic> unwrap() => Map.unmodifiable(_map);

  @override
  bool operator ==(Object other) {
    bool? result;
    if (identical(this, other)) {
      result = true;
    } else if (other is Podo && runtimeType == other.runtimeType && length == other.length) {
      for (var entry in _map.entries) {
        if (entry.value != other._map[entry.key]) {
          result = false;
          break;
        }
      }
      result ??= true;
    }
    return result ?? false;
  }

  bool valueEquals(Object other) {
    bool? result;
    if (identical(this, other)) {
      result = true;
    } else if (other is Podo && runtimeType == other.runtimeType) {
      for (var entry in _map.entries) {
        if (entry.value != other._map[entry.key]) {
          result = false;
          break;
        }
      }
      if (result == null) {
        for (var entry in other._map.entries) {
          if (entry.value != _map[entry.key]) {
            result = false;
            break;
          }
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
