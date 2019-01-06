import 'package:redux/redux.dart';

abstract class ViewModel<S, VM> {
  Store<S> _store;
  VM _vm;

  ViewModel(this._store, this._vm);

  void dispatch(dynamic action) {
    _store.dispatch(action);
  }

  VM getData() {
    return _vm;
  }
}
