import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/cart_cubit/cart_cubit.dart';
import '../../../view_model/cubit/cart_cubit/cart_state.dart';
import '../../component/cart/single_order_widget.dart';

class SingleOrderScreen extends StatelessWidget {
  const SingleOrderScreen({super.key});

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
        title: Text("Single Order",style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
      ),
      body:  BlocBuilder<CartCubit,CartState>(
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: cubit.singleOrderModel?.data?.name ?? "",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabled: false,
                      prefixIcon: Icon(Icons.person,color: Colors.teal,),
                    ),
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: cubit.singleOrderModel?.data?.email ?? "",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabled: false,
                      prefixIcon: Icon(Icons.email_rounded,color: Colors.teal,),
                    ),
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: cubit.singleOrderModel?.data?.phone ?? "",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabled: false,
                      prefixIcon: Icon(Icons.phone,color: Colors.teal,),
                    ),
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: cubit.singleOrderModel?.data?.address ?? "",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabled: false,
                      prefixIcon: Icon(Icons.location_on_sharp,color: Colors.teal,),
                    ),
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
              
                      hintText:cubit.singleOrderModel?.data?.governorate ?? "",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "city",
                      labelStyle: TextStyle(color: Colors.teal),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      alignLabelWithHint: true,
                      enabled: false,
                      prefixIcon: Icon(Icons.location_city_outlined,color: Colors.teal,),
                    ),
              
                    //cursorColor: Colors.teal,
                    //controller: CartCubit.get(context).cityController,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Total: ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      Text(cubit.singleOrderModel?.data?.total ?? "",style: TextStyle(color: Colors.teal,fontSize: 16,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  ListView.separated(
                    padding: EdgeInsets.all(25),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                    return SingleOrderWidget(order: cubit.singleOrderModel?.data?.orderProducts?[index],);
                  }, separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey,
                      thickness: 2,
                    );
                  }, itemCount: cubit.singleOrderModel?.data?.orderProducts?.length ?? 0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
