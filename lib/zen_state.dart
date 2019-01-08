import './models/cart_item.dart';

class ZenState {
  int pageView = 0;

  List<CartItem> cartItems = [
    CartItem(checked: true, name: "first"),
    CartItem(checked: true, name: "second"),
    CartItem(checked: true, name: "third"),
    CartItem(checked: true, name: "forth"),
    CartItem(checked: true, name: "fifth")
  ];
}
