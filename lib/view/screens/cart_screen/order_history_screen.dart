import 'package:book_store/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/cart_cubit/cart_state.dart';
import '../../component/cart/order_history_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text("Order History",style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
      ),
      body: BlocBuilder<CartCubit,CartState>(
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return Visibility(
            visible: (cubit.orderHistoryModel!.data!.orders ?? []).isNotEmpty,
            replacement: Center(child: Text("Order History is empty",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),),),
            child: ListView.separated(itemBuilder: (context, index) {
                      return OrderHistoryWidget(order: cubit.orderHistoryModel!.data!.orders![index],);
            },
                separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                      color: Colors.grey,
                    );
                }, itemCount: cubit.orderHistoryModel?.data?.orders?.length ?? 0),
          );
        },
      ),
    );
  }
}
