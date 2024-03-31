import 'package:book_store/view/component/carousel_slider/carousel_slider_item.dart';
import 'package:book_store/view/screens/auth_screens/login_screen.dart';
import 'package:book_store/view_model/cubit/slider_cubit/slider_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../component/best_seller_products/best_seller_item.dart';
import '../../component/best_seller_products/show_best_seller.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),),(route) => false,);
    },);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset("assets/images/book_logo2.png",width: 150,height: 150,),
      
        ),
      ),
    );
  }
}
