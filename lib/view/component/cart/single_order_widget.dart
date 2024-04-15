import 'package:book_store/model/cart_model/cart_model.dart';
import 'package:flutter/material.dart';

import '../../../model/order_model/order_model.dart';

class SingleOrderWidget extends StatelessWidget {
  final OrderProducts? order;
  const SingleOrderWidget({required this.order,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order?.productName ?? "",maxLines:2,style:TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ) ,),
                Text("Quantity: ${order?.orderProductQuantity ?? 0}",style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),),
              ],
            ),
          ),
          Text("${order?.productTotal ?? 0}",style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 16
          ),)
        ],
      ),
    );
  }
}
