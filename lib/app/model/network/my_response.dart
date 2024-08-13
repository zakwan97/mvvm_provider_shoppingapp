class MyResponse<T, V> {
  MyResponse.error(V error)
      : _status = ResponseStatus.ERROR,
        _error = error;
  MyResponse.complete(T data)
      : _status = ResponseStatus.COMPLETE,
        _data = data;
  MyResponse.loading() : _status = ResponseStatus.LOADING;

  MyResponse.initial() : _status = ResponseStatus.INITIAL;
  final ResponseStatus _status;
  T? _data;
  V? _error;

  V? get error => _error;
  T? get data => _data;
  ResponseStatus get status => _status;
}

enum ResponseStatus { INITIAL, COMPLETE, ERROR, LOADING, CONSUMED }
