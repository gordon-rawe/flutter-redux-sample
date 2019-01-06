import 'package:flutter/material.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:flutter_shoppingcart/shooping_list.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './zen_state.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import './add_item_dialog.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild ShoppingCart");
    return StoreConnector<ZenState, DevToolsStore<ZenState>>(
      converter: (store) => store,
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Shopping Cart"),
          ),
          endDrawer: ReduxDevTools(store),
          body: ShoppingList(),
          floatingActionButton: new FloatingActionButton(
              child: new Icon(Icons.add),
              onPressed: () => _openAddItemDialog(context)),
        );
      },
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddItemDialog());
}
