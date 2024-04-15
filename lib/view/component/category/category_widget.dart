import 'package:book_store/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../view_model/cubit/product_cubit/product_cubit.dart';
import '../../screens/product_screens/product_screen.dart';

class CategoryWidget extends StatelessWidget {
  final Product? category;
  const CategoryWidget({required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ProductCubit.get(context).getProductDetail(category!.id!);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(5),
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
                Image.network(category?.image ?? "",
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
                      child: Text("${category?.discount}%",style: TextStyle(
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

                    Text(category?.name ?? "",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
                    SizedBox(height:3,),
                    Text("Stock: ${category?.stock}",style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16
                    ),),
                    SizedBox(height:3,),
                    Row(
                      children: [
                        Text("\$${category?.price ?? 0}",style: TextStyle(
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                        ),),
                        SizedBox(width: 2,),
                        Text("\$${category?.price_after_discount}",style: TextStyle(
                            color: Colors.teal
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
