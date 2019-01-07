import 'package:meta/meta.dart';

class CartItem {
  String name;
  bool checked;

  CartItem({@required this.name, @required this.checked});

  @override
  String toString() {
    return "$name : $checked";
  }

  @override
  int get hashCode => name.hashCode ^ checked.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) && name == other.name && checked == other.checked;
}
