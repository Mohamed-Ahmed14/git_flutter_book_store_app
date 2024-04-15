import 'package:book_store/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../view_model/cubit/product_cubit/product_cubit.dart';
import '../../screens/product_screens/product_screen.dart';

class NewArrivalItem extends StatelessWidget {
  final Product? product;
  const NewArrivalItem({required this.product,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ProductCubit.get(context).getProductDetail(product!.id!);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
      },
      child: Container(
        width: 110,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(product?.image ?? "",height: 140,width: 120,fit: BoxFit.fill,),
                PositionedDirectional(
                  top: 3,
                  start: 5,
                  child: Container(
                    height: 25,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text("${product?.discount ?? 0}%",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.none,

                      ),),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(product?.name ?? "",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                    maxLines: 1,
                    overflow:TextOverflow.ellipsis ),
                Text(product?.category??"",style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                ),
                    maxLines: 1,
                    overflow:TextOverflow.ellipsis ),
                Text("${product?.price ?? 0} L.E",style: TextStyle(
                  color: Colors.grey[400],
                  decoration: TextDecoration.lineThrough,
                ),),
                Text("${product?.price_after_discount} L.E",style: TextStyle(
                    color: Colors.teal
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
