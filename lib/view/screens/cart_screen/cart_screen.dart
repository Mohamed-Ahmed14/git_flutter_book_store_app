import 'package:book_store/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/cart_cubit/cart_state.dart';
import '../../component/cart/cart_widget.dart';
import 'order_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    CartCubit.get(context).showCartItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

       body: BlocBuilder<CartCubit,CartState>(
         builder: (context, state) {
           var cubit = CartCubit.get(context);
           return Visibility(
             visible: (cubit.cartModel?.data?.cartItems ?? []).isNotEmpty,
             replacement: Center(child: Text("Cart is empty",style: TextStyle(
               color: Colors.grey,
               fontSize: 24,
               fontWeight: FontWeight.bold
             ),),),
             child: Stack(
               children: [
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       ListView.builder(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context, index) {
                         return CartWidget(item: cubit.cartModel!.data!.cartItems![index],);
                       },
                         itemCount:cubit.cartModel?.data?.cartItems?.length ?? 0,
                       ),
                       SizedBox(height: 60,),
                     ],
                   ),
                 ),
                 Align(alignment: AlignmentDirectional.bottomCenter,
                   child: Container(
                     padding: EdgeInsets.all(5),
                     margin: EdgeInsets.all(10),
                     height: 60,
                     width: 320,
                     decoration: BoxDecoration(
                       color: Colors.teal,
                       borderRadius: BorderRadius.circular(12),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("Total Price"),
                         Text("${cubit.cartModel?.data?.total ?? ""}"),
                         InkWell(
                           onTap: (){
                             cubit.checkOut().then((value){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen(),));
                             });

                           },
                           child: Container(
                             height: 30,
                             width: 100,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(20),
                             ),
                             child: Center(
                               child: Text("CheckOut",style: TextStyle(
                                 color: Colors.teal,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 16,
                               ),),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           );
         },

       ),
      ),
    );
  }
}
