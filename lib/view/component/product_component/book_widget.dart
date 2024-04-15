import 'package:book_store/model/product_model/product_model.dart';
import 'package:book_store/view/screens/product_screens/product_screen.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final Product? product;
  final bool isFavourite;
  const BookWidget({this.isFavourite=false,required this.product,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ProductCubit.get(context).getProductDetail(product!.id!);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 3,bottom: 3),
        margin: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(product?.image ?? "",
                  width: 120,height: 120,errorBuilder: (context, error, stackTrace) => Icon(Icons.error_outline_rounded),),
                PositionedDirectional(
                  top: 5,
                  start: 20,
                  child: Container(
                    height: 25,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text("${product?.discount}%",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.none,

                      ),),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(product?.name ?? "",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                    SizedBox(height:3,),
                    Text("Stock: ${product?.stock}",style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16
                    ),),
                    SizedBox(height:3,),
                    Text("\$${product?.price ?? 0}",style: TextStyle(
                      color: Colors.grey[400],
                      decoration: TextDecoration.lineThrough,
                    ),),
                    Text("\$${product?.price_after_discount}",style: TextStyle(
                        color: Colors.teal
                    ),),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed:(){
                    var cubit = ProductCubit.get(context);
                    if(cubit.isFaouriteItem(product!.id!))
                      {
                        cubit.removeFromFavourite(product!.id!);
                      }else{
                      cubit.addToFavourite(product!.id!);
                    }
                  },
                      icon:Icon(isFavourite?Icons.favorite_outlined:Icons.favorite_border_outlined,
                        color:isFavourite?Colors.teal:Colors.black,)),
                  IconButton(onPressed:(){},
                      icon:Icon(Icons.add_shopping_cart_outlined)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
