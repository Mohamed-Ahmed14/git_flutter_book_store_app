import 'package:book_store/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:book_store/view_model/cubit/layout_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen/home_screen.dart';

class LayoutScreen extends StatelessWidget {
   const LayoutScreen({super.key});





  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit,LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.current_index,
            onTap: (value){
              cubit.changeLayout(value);
            },
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: "Books",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: "Favourite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
          body: cubit.screens[cubit.current_index],
        );
      },

    );
  }
}
