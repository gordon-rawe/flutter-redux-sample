import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/reducers/reducers.dart';
import './shopping/shopping_cart.dart';
import 'package:redux/redux.dart';
import './middlewares/cart_middle_ware.dart';
import './zen_state.dart';
import './framework/dispatcher.dart';

void main() {
  final store =
      Store<ZenState>(cartItemsReducer, initialState: ZenState(), distinct: false, middleware: [
        cartMiddleWare
      ]);
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
