import 'package:book_store/view/component/best_seller_products/show_best_seller.dart';
import 'package:book_store/view/component/category/show_categories.dart';
import 'package:book_store/view/component/new_arrivals_products/show_new_arrival.dart';
import 'package:flutter/material.dart';

import '../../../view_model/cubit/slider_cubit/slider_cubit.dart';
import '../../component/carousel_slider/show_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi Mohamed",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),),
            Text("What are you reading today?",style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 30,
            backgroundImage:Image.network("https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg").image ,
          )
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            ShowSlider(),
            ShowBestSellerProducts(),
            ShowCategory(),
            ShowNewArrivals(),
            
          ],
        ),
      ),
    );
  }
}
