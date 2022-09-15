import 'package:flutter/material.dart';
import 'package:mercadin/src/config/custom_colors.dart';
import 'package:mercadin/src/pages/commons_widgets/quantity_widget.dart';

import '../../../models/cart_item.dart';
import '../../../services/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  final UtilsServices utilsServices = UtilsServices();

  CartTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //imagem
        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        //titulo
        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        //Total
        subtitle: Text(
          utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        //Quantidade
        trailing: QuantityWidget(
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
          result: (quantity) {},
        ),
      ),
    );
  }
}
