import 'package:redux/redux.dart';

class Dispatcher {
  static Store _store;

  static void dispatch(dynamic action) {
    _store.dispatch(action);
  }

  static void maintain(Store store) {
    _store = store;
  }
}
