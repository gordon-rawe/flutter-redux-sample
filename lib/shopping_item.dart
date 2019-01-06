import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/action.dart';
import './zen_state.dart';
import 'package:redux/redux.dart';
import './view_model.dart';

class ShoppingItemVM<ZenState, CartItem> extends ViewModel {
  ShoppingItemVM(Store<ZenState> s, CartItem vm) : super(s, vm);
}

class ShoppingItem extends StatefulWidget {
  final int index;

  const ShoppingItem({Key key, this.index}) : super(key: key);

  @override
  ShoppingItemState createState() {
    print("ShoppingItemState=---->");
    return ShoppingItemState();
  }
}

class ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    print("rebuild ShoppingItem");
    return StoreConnector<ZenState, ShoppingItemVM<ZenState, CartItem>>(
      converter: (store) =>
          ShoppingItemVM(store, store.state.cartItems[widget.index]),
      builder: (context, cartItemVM) {
        return Dismissible(
          onDismissed: (_) {
            cartItemVM.dispatch(DeleteItemAction(cartItemVM.getData()));
          },
          child: ListTile(
            title: TextField(),
            // subtitle: TextField(),
            leading: Checkbox(
                value: cartItemVM.getData().checked,
                onChanged: (newValue) {
                  print(this);
                  cartItemVM
                      .dispatch(ToggleStateItemAction(cartItemVM.getData()));
                }),
          ),
          key: Key(cartItemVM.getData().name),
        );
      },
    );
  }
}
