

import 'package:bloc/bloc.dart';
import 'package:book_store/view/screens/auth_screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/screens/home_screen/home_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState>{

  LayoutCubit():super(LayoutInitState());

  static LayoutCubit get(context)=>BlocProvider.of<LayoutCubit>(context);

  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  int current_index = 0;

  void changeLayout(int value) async{
    current_index = value;
    emit(ChangeLayoutSuccessState());
  }
}