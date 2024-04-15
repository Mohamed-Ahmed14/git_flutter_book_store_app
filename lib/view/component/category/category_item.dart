import 'package:book_store/model/category_model/category_model.dart';
import 'package:book_store/view/screens/home_screen/categories_screen.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category? category;
  const CategoryItem({required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ProductCubit.get(context).getCategoryProducts(category!.id!);
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen(),));
      },
      child: Container(
        width: 105,
        height: 120,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.network("https://img.freepik.com/premium-photo/stack-books-with-one-that-says-word-it_865967-52116.jpg",).image
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
      ),
    );
  }
}
