import 'package:book_store/model/cart_model/cart_model.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final CartItems? order;
  const OrderWidget({required this.order,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(order?.itemProductName ?? "",maxLines:3,style:TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ) ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quantity: ${order?.itemQuantity ?? 0}",style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),),
              Text("${order?.itemTotal ?? 0}",style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
