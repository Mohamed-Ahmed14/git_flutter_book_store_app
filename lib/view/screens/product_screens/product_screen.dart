import 'package:book_store/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/product_component/show_product_details.dart';
import '../../component/product_component/show_product_image.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductState>(
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Visibility(
              visible: (cubit.productDetailModel != null),
              replacement: Center(
                child: CircularProgressIndicator(),
              ),

              child: Stack(
                children: [
                  ListView(
                    children: [
                      ShowProductImage(),
                      ShowProductDetails(),

                    ],
                  ),
                  Align(alignment: AlignmentDirectional.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            CartCubit.get(context).addItemToCart(ProductCubit.get(context).productDetailModel?.id?? 0);
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 50),
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                          child: Text("Add to cart"),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
