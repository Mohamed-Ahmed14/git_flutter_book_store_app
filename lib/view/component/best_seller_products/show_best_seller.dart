
import 'package:book_store/view/component/best_seller_products/best_seller_item.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBestSellerProducts extends StatelessWidget {
  const ShowBestSellerProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Text("Best Seller",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),)),
              Icon(Icons.arrow_forward_rounded)
            ],
          ),
          SizedBox(height: 10,),
          BlocBuilder<ProductCubit,ProductState>(
            builder: (context, state) {
              return Visibility(
                visible: (ProductCubit.get(context).bestSellerModel?.data?.products ?? []).isNotEmpty,
                replacement: CircularProgressIndicator(),
                child: SizedBox(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BestSellerItem(product: ProductCubit.get(context).bestSellerModel?.data?.products?[index],);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10,);
                    },
                    itemCount: ProductCubit.get(context).bestSellerModel?.data?.products?.length ?? 0,),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
