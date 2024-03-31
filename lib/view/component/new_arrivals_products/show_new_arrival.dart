

import 'package:book_store/view/component/new_arrivals_products/new_arrival_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/product_cubit/product_cubit.dart';
import '../../../view_model/cubit/product_cubit/product_state.dart';

class ShowNewArrivals extends StatelessWidget {
  const ShowNewArrivals({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCubit.get(context).getNewArrivals();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Text("New Arrivals",style: TextStyle(
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
                visible: (ProductCubit.get(context).newArrivalModel?.data?.products ?? []).isNotEmpty,
                replacement: CircularProgressIndicator(),
                child: SizedBox(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return NewArrivalItem(product: ProductCubit.get(context).newArrivalModel?.data?.products?[index],);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10,);
                    },
                    itemCount: ProductCubit.get(context).newArrivalModel?.data?.products?.length ?? 0,),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
