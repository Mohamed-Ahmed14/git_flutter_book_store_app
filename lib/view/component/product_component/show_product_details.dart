import 'package:flutter/material.dart';

import '../../../view_model/cubit/product_cubit/product_cubit.dart';

class ShowProductDetails extends StatelessWidget {
  const ShowProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ProductCubit.get(context).productDetailModel?.name ?? "",style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          Row(
            children: [
              Expanded(
                child: Text(ProductCubit.get(context).productDetailModel?.category ?? "",style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                ),),
              ),
              Column(
                children: [
                  Text(ProductCubit.get(context).productDetailModel?.price ?? "",style: TextStyle(
                    color: Colors.grey[400],
                    decoration: TextDecoration.lineThrough,
                  ),),
                  Text("${ProductCubit.get(context).productDetailModel?.price_after_discount ?? ""}",style: TextStyle(
                      color: Colors.teal
                  ),),
                ],
              ),
            ],
          ),
          Text("Description:",style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
          Text(ProductCubit.get(context).productDetailModel?.description ?? "",style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
    );
  }
}
