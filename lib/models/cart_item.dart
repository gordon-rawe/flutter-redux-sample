import 'package:meta/meta.dart';

class CartItem {
  String name;
  bool checked;

  CartItem({@required this.name, @required this.checked});

  @override
  String toString() {
    return "$name : $checked";
  }
  
  //对于Object来说行不通
  // @override
  // int get hashCode => name.hashCode ^ checked.hashCode;

  // @override
  // bool operator ==(other) => (name == other.name && checked == other.checked);
}
