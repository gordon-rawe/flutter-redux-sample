import 'package:flutter/material.dart';
import './shopping_list.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import '../zen_state.dart';
import './add_item_dialog.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({Key key}) : super(key: key);

  // 这里写不好容易导致整棵树的重绘，是效率的最大的问题，作者stupid了,或者是作者演示的时候完全不考虑性能。
  // @override
  // Widget build(BuildContext context) {
  //   return StoreConnector<ZenState, Store<ZenState>>(
  //     converter: (store) => store,//这里实际上是创建了一路新的Store监听，每次都会不一样，容易看蒙蔽
  //     builder: (context, store) {
  //       return Scaffold(
  //         appBar: AppBar(
  //           title: Text("Shopping Cart"),
  //         ),
  //         // endDrawer: ReduxDevTools(store),
  //         body: ShoppingList(),
  //         floatingActionButton: new FloatingActionButton(
  //             child: new Icon(Icons.add),
  //             onPressed: () => _openAddItemDialog(context)),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      endDrawer: StoreConnector<ZenState, DevToolsStore<ZenState>>(
        converter: (store) => store,
        builder: (context, store) => ReduxDevTools(store),
      ),
      body: ShoppingList(),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () => _openAddItemDialog(context)),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddItemDialog());
}
