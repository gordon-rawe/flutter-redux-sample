import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/action.dart';
import './zen_state.dart';
// import 'package:redux/redux.dart';
// import './view_model.dart';
import './dispatcher.dart';

// class ShoppingItemVM<ZenState, CartItem> extends ViewModel {
//   ShoppingItemVM(Store<ZenState> s, CartItem vm) : super(s, vm);
// }

class ShoppingItem extends StatefulWidget {
  final int index;

  const ShoppingItem({Key key, this.index}) : super(key: key);

  @override
  ShoppingItemState createState() {
    print("rebuild state");
    return ShoppingItemState();
  }
}

class ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    print("rebuild ShoppingItem -----> ${widget.hashCode} $this");
    return StoreConnector<ZenState, CartItem>(
      distinct: true,
      onWillChange: (data) {
        print("ShoppingItemState onWillChange ----> ${data.name}");
      },
      converter: (store) => store.state.cartItems[widget.index],
      builder: (context, cartItemVM) {
        return Dismissible(
          onDismissed: (_) {
            Dispatcher.dispatch(DeleteItemAction(cartItemVM));
          },
          child: ListTile(
            title: TextField(),
            // subtitle: TextField(),
            leading: Checkbox(
                value: cartItemVM.checked,
                onChanged: (newValue) {
                  Dispatcher.dispatch(ToggleStateItemAction(cartItemVM));
                }),
          ),
          key: Key(cartItemVM.name),
        );
      },
    );
  }
}
