import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/redux/reducers.dart';
import 'package:flutter_shoppingcart/shooping_cart.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import './zen_state.dart';
import 'dispatcher.dart';

void main() {
  final store =
      new DevToolsStore<ZenState>(cartItemsReducer, initialState: ZenState());
  Dispatcher.maintain(store);
  runApp(new ShoppingApp(store));
}

class ShoppingApp extends StatelessWidget {
  final DevToolsStore<ZenState> store;

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
