import 'package:book_store/model/order_model/order_model.dart';
import 'package:book_store/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

import '../../screens/cart_screen/single_order_screen.dart';

class OrderHistoryWidget extends StatelessWidget {
  final Orders order;
  const OrderHistoryWidget({required this.order,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          CartCubit.get(context).showSingleOrder(order.id ?? 0).then((value){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SingleOrderScreen(),));
          });
      },
      child: Container(
        padding: EdgeInsets.all(15),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.orderCode ?? "",style: TextStyle(
                  fontSize: 16,
                ),),
                Text(order.orderDate ?? "",style: TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            Text(order.total ?? "",style: TextStyle(
              fontSize: 16,
            ),),
          ],
        ),

      ),
    );
  }
}
