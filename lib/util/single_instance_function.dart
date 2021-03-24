class SingleInstanceFunction<R> {
  final Future<R> Function() _func;

  SingleInstanceFunction(Future<R> Function() func) : _func = func;
  bool _isCalled = false;

  Future<R?> call() async {
    if (_isCalled) {
      print('func is being called already...');
      return null;
    }
    _isCalled = true;
    final result = await _func();
    _isCalled = false;
    return result;
  }
}
