import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/shopping_item.dart';
import 'zen_state.dart';
import './view_model.dart';
import 'package:redux/redux.dart';

class ShoppingListVM extends ViewModel {
  ShoppingListVM(Store<ZenState> s/** 当不需要dispatch的时候，可以传null*/, List<CartItem> vm) : super(s, vm);
}

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("rebuild ShoppingList");
    return StoreConnector<ZenState, ShoppingListVM>(
      converter: (store) => ShoppingListVM(store, store.state.cartItems),
      builder: (context, listVM) => ListView.builder(
            itemCount: listVM.getData().length,
            itemBuilder: (context, index) => ShoppingItem(
                  index: index,
                ),
          ),
    );
  }
}
