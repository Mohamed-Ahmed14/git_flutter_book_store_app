import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/product_cubit/product_state.dart';
import '../../component/product_component/book_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {
    // TODO: implement initState
    ProductCubit.get(context).getFavourite();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<ProductCubit,ProductState>(
            builder: (context, state) {
              var cubit = ProductCubit.get(context);
              return Visibility(
                visible: (cubit.favouriteModel?.data?.dataList ?? []).isNotEmpty,
                replacement:const Center(child: Text("Favourite is empty",style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),),),
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return BookWidget(product: cubit.favouriteModel?.data?.dataList?[index],isFavourite: true,);
                    },
                    itemCount: cubit.favouriteModel?.data?.dataList?.length),
              );
            },
          ),
        ),
      ),
    );
  }
}
