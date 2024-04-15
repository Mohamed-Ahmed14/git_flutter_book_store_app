import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/product_cubit/product_state.dart';
import '../../component/category/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_rounded)),
      ),
      body: BlocBuilder<ProductCubit,ProductState>(
        builder: (context, state) {
          var cubit = ProductCubit.get(context);
          return Visibility(
            visible: (cubit.catProductModel?.data?.products ?? []).isNotEmpty,
            replacement: Center(child: CircularProgressIndicator()),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return CategoryWidget(category: cubit.catProductModel?.data?.products?[index],);
                },
                itemCount: cubit.catProductModel?.data?.products?.length),
          );
        },

      ),
    );
  }
}
