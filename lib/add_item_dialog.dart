import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/action.dart';
import './zen_state.dart';
import 'package:redux/redux.dart';

class AddItemDialog extends StatefulWidget {
  @override
  AddItemDialogState createState() {
    return new AddItemDialogState();
  }
}

class AddItemDialogState extends State<AddItemDialog> {
  Store<ZenState> _store;

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<ZenState, Store<ZenState>>(
      converter: (store) => _store = store,
      builder: (context, callback) => new AlertDialog(
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
                    _store.dispatch(AddItemAction(CartItem(
                        name: _textEditingController.text, checked: false)));
                    Navigator.pop(context);
                  },
                  child: new Text("Add"))
            ],
          ),
    );
  }
}
