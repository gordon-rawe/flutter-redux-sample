import 'package:redux/redux.dart';

@Deprecated("使用不好可能会造成性能问题")
class ViewModel<S, VM> {
  Store<S> _store;
  VM _vm;

  ViewModel(this._store, this._vm);

  void dispatch(dynamic action) {
    _store.dispatch(action);
  }

  VM getData() {
    return _vm;
  }

  // @override
  // int get hashCode => _vm.hashCode;

  // @override
  // operator == (other) => other._vm == _vm;
}
