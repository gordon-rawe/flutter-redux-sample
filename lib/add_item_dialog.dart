import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/action.dart';
import './zen_state.dart';
import 'package:redux/redux.dart';
import './view_model.dart';

class AddItemDialogVM extends ViewModel {
  AddItemDialogVM(Store<ZenState> store) : super(store, null /**不需要数据可以传递 */);
}

class AddItemDialog extends StatefulWidget {
  @override
  AddItemDialogState createState() {
    return new AddItemDialogState();
  }
}

class AddItemDialogState extends State<AddItemDialog> {//这里因为需要dispatch，所以可以不要VM，直接缓存store也行

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<ZenState, AddItemDialogVM>(
      converter: (store) => AddItemDialogVM(store),
      builder: (context, pageVM) => new AlertDialog(
            title: Text('Add Item'),
            contentPadding: const EdgeInsets.all(16.0),
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: "Item Name", hintText: "Eg. Apple"),
                  onChanged: (text) {
                    _textEditingController.text = text;
                  },
                ))
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("Cancel")),
              new FlatButton(
                  onPressed: () {
                    pageVM.dispatch(AddItemAction(CartItem(
                        name: _textEditingController.text, checked: false)));
                    Navigator.pop(context);
                  },
                  child: new Text("Add"))
            ],
          ),
    );
  }
}
