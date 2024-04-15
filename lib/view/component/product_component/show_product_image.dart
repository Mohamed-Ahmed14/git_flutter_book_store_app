import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';

class ShowProductImage extends StatelessWidget {
  const ShowProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
                image:  Image.network(ProductCubit.get(context).productDetailModel?.image ?? "").image,
                fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[500],
                  ),
                  child: Icon(Icons.arrow_back_outlined,
                    color: Colors.white,
                    size: 25,),
                ),
              ),
              InkWell(
                onTap: (){
                  var cubit = ProductCubit.get(context);
                  if(cubit.isFaouriteItem(cubit.productDetailModel!.id!))
                  {
                    cubit.removeFromFavourite(cubit.productDetailModel!.id!);
                  }else{
                    cubit.addToFavourite(cubit.productDetailModel!.id!);
                  }
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[500],
                  ),
                  child: Icon(
                    ProductCubit.get(context).isFaouriteItem(
                        ProductCubit.get(context).productDetailModel!.id!)?
                    Icons.favorite_outlined:Icons.favorite_border_outlined,
                    color:ProductCubit.get(context).isFaouriteItem(
                        ProductCubit.get(context).productDetailModel!.id!)?
                    Colors.teal:Colors.white,
                      ),

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
