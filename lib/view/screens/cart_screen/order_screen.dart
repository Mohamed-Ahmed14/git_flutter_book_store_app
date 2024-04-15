

import 'package:book_store/view/screens/home_screen/home_screen.dart';
import 'package:book_store/view/screens/layout_screen/layout_screen.dart';
import 'package:book_store/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/cart_cubit/cart_state.dart';

import '../../component/cart/order_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_backspace_outlined,color: Colors.black,),
          ),
        ),
        body: BlocBuilder<CartCubit,CartState>(
          builder: (context, state) {
            var cubit = CartCubit.get(context);
            return Visibility(
              visible: (cubit.orderModel?.data?.cartItems ?? [] ).isNotEmpty,
              replacement: Center(child: CircularProgressIndicator(),),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                  labelText: "name",
                                  labelStyle: TextStyle(color: Colors.teal),
                                  alignLabelWithHint: true,
                                  enabled:true,
                                  prefixIcon: Icon(Icons.person,color: Colors.teal,),
                                ),
                                showCursor: true,
                                cursorColor: Colors.teal,
                                controller: CartCubit.get(context).nameController,
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                  labelText: "email",
                                  labelStyle: TextStyle(color: Colors.teal),
                                  alignLabelWithHint: true,
                                  enabled: false,
                                  prefixIcon: Icon(Icons.email_rounded,color: Colors.teal,),
                                ),
                                cursorColor: Colors.teal,
                                controller: CartCubit.get(context).emailController,
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                  labelText: "phone",
                                  labelStyle: TextStyle(color: Colors.teal),
                                  alignLabelWithHint: true,
                                  enabled:true,
                                  prefixIcon: Icon(Icons.phone,color: Colors.teal,),
                                ),

                                cursorColor: Colors.teal,
                                controller: CartCubit.get(context).phoneController,
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                  labelText: "address",
                                  labelStyle: TextStyle(color: Colors.teal),
                                  alignLabelWithHint: true,
                                  enabled:true,
                                  prefixIcon: Icon(Icons.location_on_sharp,color: Colors.teal,),
                                ),

                                cursorColor: Colors.teal,
                                controller: CartCubit.get(context).addressController,

                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                  labelText: "city",
                                  labelStyle: TextStyle(color: Colors.teal),
                                  alignLabelWithHint: true,
                                  enabled:true,
                                  prefixIcon: Icon(Icons.location_city_outlined,color: Colors.teal,),
                                ),

                                cursorColor: Colors.teal,
                                controller: CartCubit.get(context).cityController,
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder:(context, index) {
                          return OrderWidget(order: CartCubit.get(context).orderModel?.data?.cartItems?[index],);
                        }, separatorBuilder: (context, index) {
                          return SizedBox(height: 5,);
                        }, itemCount: CartCubit.get(context).orderModel?.data?.cartItems?.length ?? 0),
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
                          Text("${cubit.orderModel?.data?.total ?? ""}"),
                          InkWell(
                            onTap: (){
                              cubit.placeOrder().then((value){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutScreen(),));
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
                                child: Text("Order Now!",style: TextStyle(
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
