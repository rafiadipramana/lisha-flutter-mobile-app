import 'dart:async';

class NavigationService {
  static final Map<String, Completer<bool>> _completers = {};
  
  static void setCompleter(String key, Completer<bool> completer) {
    _completers[key] = completer;
  }

  static Completer<bool>? getCompleter(String key) {
    return _completers[key];
  }

  static void complete(String key, bool result) {
    final completer = _completers[key];
    if (completer != null) {
      completer.complete(result);
      _completers.remove(key);
    }
  }
}