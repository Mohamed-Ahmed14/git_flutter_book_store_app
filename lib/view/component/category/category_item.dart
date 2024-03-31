import 'package:book_store/model/category_model/category_model.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category? category;
  const CategoryItem({required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: Image.network("https://img.freepik.com/premium-photo/stack-books-with-one-that-says-word-it_865967-52116.jpg",fit: BoxFit.fill,width: 110,height: 110,).image
        )
      ),
      child:Center(
        child: Text(category?.name ?? "",style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white
        ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
