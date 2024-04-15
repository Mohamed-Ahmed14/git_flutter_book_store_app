

import 'package:book_store/view/component/best_seller_products/show_best_seller.dart';
import 'package:book_store/view/component/category/show_categories.dart';
import 'package:book_store/view/component/new_arrivals_products/show_new_arrival.dart';
import 'package:book_store/view/screens/account_screen/account_screen.dart';
import 'package:book_store/view/screens/auth_screens/login_screen.dart';
import 'package:book_store/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:book_store/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:book_store/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';

import '../../../view_model/cubit/product_cubit/product_cubit.dart';
import '../../../view_model/cubit/slider_cubit/slider_cubit.dart';
import '../../component/carousel_slider/show_slider.dart';
import '../account_screen/change_password_screen.dart';
import '../cart_screen/order_history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SliderCubit.get(context).getSlider();
    ProductCubit.get(context).getBestSeller();
    ProductCubit.get(context).getCategories();
    ProductCubit.get(context).getNewArrivals();
    ProductCubit.get(context).getFavourite();
    ProfileCubit.get(context).showProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(25),
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: Image.asset("assets/images/profile-picture.jpeg").image,
                  ),
                  Text(ProfileCubit.get(context).profileNameController.text,style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  Text(ProfileCubit.get(context).profileEmailController.text,style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),),

                ],
              ),
            ),
            SizedBox(height: 10,),
            TextButton(onPressed:(){
              CartCubit.get(context).getOrderHistory().then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryScreen(),));
              });
            },
                child: Row(
                  children: [
                    Icon(Icons.history_edu_outlined,size: 30,color: Colors.grey,),
                    SizedBox(width: 5,),
                    Text("Order History",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                  ],
                )),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            TextButton(onPressed:(){
              ProfileCubit.get(context).isFromDrawer=true;
              ProfileCubit.get(context).isEditPressed=true;
              Navigator.push(context,MaterialPageRoute(builder: (context) => AccountScreen(),));
            },
                child: Row(
                  children: [
                    Icon(Icons.edit,size: 30,color: Colors.grey,),
                    SizedBox(width: 5,),
                    Text("Edit Profile",style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ],
                )),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            TextButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassScreen(),));
            },
                child: Row(
                  children: [
                    Icon(Icons.repeat
                      ,size: 30,color: Colors.grey,),
                    SizedBox(width: 5,),
                    Text("Change Password",style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ],
                )),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            TextButton(onPressed:(){
              ProfileCubit.get(context).logout();
              AuthCubit.get(context).reset();
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            },
                child: Row(
                  children: [
                    Icon(Icons.logout,size: 30,color: Colors.red,),
                    SizedBox(width: 5,),
                    Text("Logout",style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ],
                )),
          ],
        ),
      ),
      appBar: AppBar(
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi ${ProfileCubit.get(context).profileNameController.text}",style: TextStyle(
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
            backgroundImage:AssetImage("assets/images/profile-picture.jpeg") ,
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
