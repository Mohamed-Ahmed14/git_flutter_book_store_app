import 'package:book_store/view/component/product_component/book_widget.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});


  @override
  State<BooksScreen> createState() => _BooksScreenState();

}


class _BooksScreenState extends State<BooksScreen> {
  @override
  initState()
  {
    ProductCubit.get(context).getAllProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: SearchBar(
                    padding:MaterialStatePropertyAll(EdgeInsetsDirectional.all(5)),
                    leading: Icon(Icons.search_outlined),
                    textStyle: MaterialStatePropertyAll(TextStyle(
                       fontWeight: FontWeight.w600,
                      fontSize: 16
                    )),
                    hintText:"Search",
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                ),
                SizedBox(height: 10,),
                BlocBuilder<ProductCubit,ProductState>(
                  builder: (context, state) {
                    var cubit = ProductCubit.get(context);
                    return Visibility(
                      visible: (cubit.productsModel?.data?.products ?? []).isNotEmpty,
                      replacement: Center(child: CircularProgressIndicator(),),
                      child: ListView.builder(
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BookWidget(product: cubit.productsModel?.data?.products?[index],
                            isFavourite: cubit.isFaouriteItem(cubit.productsModel?.data?.products?[index].id ?? 0),);
                          },
                          itemCount: cubit.productsModel?.data?.products?.length),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
