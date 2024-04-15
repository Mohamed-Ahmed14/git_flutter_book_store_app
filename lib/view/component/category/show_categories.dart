import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_item.dart';

class ShowCategory extends StatelessWidget {

  const ShowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text("Categories",style: TextStyle(
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
                visible: (ProductCubit.get(context).categoryModel?.data?.category ?? []).isNotEmpty,
                replacement: CircularProgressIndicator(),
                child: SizedBox(
                  height: 120,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsetsDirectional.all(8),
                      itemBuilder: (context, index) {
                        return CategoryItem(category: ProductCubit.get(context).categoryModel?.data?.category?[index],);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10,);
                      },
                      itemCount: ProductCubit.get(context).categoryModel?.data?.category?.length ?? 0),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
