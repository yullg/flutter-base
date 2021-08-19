class Result<T> {
  final T? _data;
  final Object? _error;
  final StackTrace? _stackTrace;

  Result.nothing()
      : _data = null,
        _error = null,
        _stackTrace = null;

  Result.withData(T data)
      : _data = data,
        _error = null,
        _stackTrace = null;

  Result.withError(Object error, [StackTrace? stackTrace])
      : _data = null,
        _error = error,
        _stackTrace = stackTrace;

  T? get data => _data;

  Object? get error => _error;

  StackTrace? get stackTrace => _stackTrace;

  T get requireData => _data!;

  bool hasData() => _data != null;

  bool hasError() => _error != null;

  @override
  int get hashCode => _data.hashCode ^ _error.hashCode ^ _stackTrace.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result && runtimeType == other.runtimeType && _data == other._data && _error == other._error && _stackTrace == other._stackTrace;

  @override
  String toString() {
    return 'Result{_data: $_data, _error: $_error, _stackTrace: $_stackTrace}';
  }
}
