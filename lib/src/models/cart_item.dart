import 'package:mercadin/src/models/item_model.dart';

class CartItem {
  late ItemModel item;
  late int quantity;

  CartItem({required this.item, required this.quantity});

  double totalPrice() => item.price * quantity;

}
