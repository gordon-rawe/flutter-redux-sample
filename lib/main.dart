import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/redux/reducers.dart';
import 'package:flutter_shoppingcart/shooping_cart.dart';
import 'package:redux/redux.dart';
import './zen_state.dart';
import 'dispatcher.dart';

void main() {
  final store =
      Store<ZenState>(cartItemsReducer, initialState: ZenState(), distinct: false);
  Dispatcher.maintain(store);
  runApp(new ShoppingApp(store));
}

class ShoppingApp extends StatelessWidget {
  final Store<ZenState> store;

  ShoppingApp(this.store);

  @override
  Widget build(BuildContext context) {
    print("rebuild ShoppingApp");
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData.dark(),
        home: new ShoppingCart(),
      ),
    );
  }
}
