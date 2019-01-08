import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/models/cart_item.dart';
import './shopping_item.dart';
import '../zen_state.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("rebuild ShoppingList -----> ${this.hashCode}");
    return StoreConnector<ZenState, List<CartItem>>(
      distinct: true,
      onWillChange: (data) {
        print("ShoppingList onWillChange ----> $data $hashCode");
      },
      converter: (store) => store.state.cartItems,
      builder: (context, listVM) => ListView.builder(
            itemCount: listVM.length,
            itemBuilder: (context, index) => ShoppingItem(
                  index: index,
                ),
          ),
    );
  }
}
