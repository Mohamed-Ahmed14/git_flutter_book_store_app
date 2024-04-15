import 'package:book_store/model/cart_model/cart_model.dart';
import 'package:book_store/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final CartItems item;
  const CartWidget({required this.item,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey,width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.network(item.itemProductImage ?? "").image,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              children: [
                Text(item.itemProductName ?? "",style: TextStyle(color: Colors.grey,
                overflow: TextOverflow.ellipsis),
                maxLines: 2),
                SizedBox(height: 5,),
                Container(
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed:(){
                          print("Plus 1");
                          if(item.itemQuantity == item.itemProductStock)
                            {
                              print("Out of stock");
                            }
                          else{
                            CartCubit.get(context).updateCart(item.itemId ?? 0,(item.itemQuantity ?? 0)+1);
                          }

                        },
                            iconSize: 20,
                            padding: EdgeInsets.all(3),
                            style: IconButton.styleFrom(
                              fixedSize: Size(20,12),
                            ),
                            highlightColor: Colors.transparent,
                            icon: Icon(Icons.add,opticalSize: 20,)),
                        Text("${item.itemQuantity ?? ""} "),
                        IconButton(onPressed:(){
                          if(item.itemQuantity! > 1)
                            {
                              print("minus 1");
                              CartCubit.get(context).updateCart(item.itemId ?? 0,(item.itemQuantity ?? 2)-1);
                            }
                        },
                            iconSize: 18,
                            padding: EdgeInsets.all(10),
                            highlightColor: Colors.transparent,
                            icon: Icon(Icons.maximize_rounded,opticalSize: 18,
                            color: ((item.itemQuantity ?? 0) > 1)? Colors.black : Colors.grey ,)
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(onPressed:(){
                CartCubit.get(context).removeCartItem(item.itemId?? 0);
              },
                  icon: Icon(Icons.delete,color: Colors.red,)),
              Text((item.itemProductPrice?? "") + " L.E" ,style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),),
              Text("${item.itemProductPriceAfterDiscount ?? ""} L.E",style: TextStyle(
                color: Colors.teal
              ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
