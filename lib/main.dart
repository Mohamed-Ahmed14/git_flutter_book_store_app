

import 'package:book_store/view/screens/account_screen/account_screen.dart';
import 'package:book_store/view/screens/auth_screens/login_screen.dart';
import 'package:book_store/view/screens/auth_screens/register_screen.dart';
import 'package:book_store/view/screens/home_screen/categories_screen.dart';
import 'package:book_store/view/screens/home_screen/home_screen.dart';
import 'package:book_store/view/screens/layout_screen/layout_screen.dart';
import 'package:book_store/view/screens/product_screens/books_screen.dart';
import 'package:book_store/view/screens/product_screens/product_screen.dart';
import 'package:book_store/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:book_store/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:book_store/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:book_store/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:book_store/view_model/cubit/slider_cubit/slider_cubit.dart';
import 'package:book_store/view_model/data/local/shared_helper.dart';
import 'package:book_store/view_model/data/local/shared_keys.dart';
import 'package:book_store/view_model/data/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/screens/splash_screen/splash_screen.dart';

void main(){
 WidgetsFlutterBinding.ensureInitialized();
 SharedHelper.init();
 DioHelper.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthCubit(),),
      BlocProvider(create: (context) => SliderCubit(),),
      BlocProvider(create: (context) => ProductCubit(),),
      BlocProvider(create: (context) => LayoutCubit(),),
      BlocProvider(create: (context) => ProfileCubit(),),
      BlocProvider(create: (context) => CartCubit(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}