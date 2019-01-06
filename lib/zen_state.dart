import './model/cart_item.dart';

class ZenState {
  int pageView = 0;

  List<CartItem> cartItems = [
    CartItem(checked: true, name: "first"),
    CartItem(checked: true, name: "second")
  ];
}
