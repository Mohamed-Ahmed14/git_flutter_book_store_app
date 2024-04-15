

import 'package:bloc/bloc.dart';
import 'package:book_store/view_model/data/local/shared_helper.dart';
import 'package:book_store/view_model/data/local/shared_keys.dart';
import 'package:book_store/view_model/data/network/dio_helper.dart';
import 'package:book_store/view_model/data/network/end_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(InitState());

  static AuthCubit get(context)=>BlocProvider.of<AuthCubit>(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  GlobalKey<FormState> formKeyR =GlobalKey<FormState>();

  bool obscureText=true;

  void changeObscure()
  {
    obscureText=!obscureText;
    emit(ChangeObscureSuccessState());
  }

  void reset()
  {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmedPasswordController.clear();
  }


  //register

Future<void> register()async{

    emit(LoadingRegisterState());

    await DioHelper.post(
        endPoint: EndPoints.register,
    body: {
          "name":nameController.text,
          "email":emailController.text,
          "password":passwordController.text,
          "password_confirmation":confirmedPasswordController.text,
    },
    ).then((value) {
      print(value.data);

      emit(SuccessRegisterState());
    }).catchError((error){
      print(error.response.data.toString());
      emit(ErrorRegisterState());
      throw error;
    });
}

//login

Future<void> login() async{

    emit(LoadingLoginState());

    await DioHelper.post(
        endPoint: EndPoints.login,
    body: {
          "email":emailController.text,
          "password":passwordController.text,
    }).then((value) async{
      print(value.data);
      SharedHelper.set(key: SharedKeys.token, value: value.data["data"]["token"]);
      SharedHelper.set(key: SharedKeys.id, value: value.data["data"]["user"]["id"]);
      SharedHelper.set(key: SharedKeys.name, value: value.data["data"]["user"]["name"]);
      SharedHelper.set(key: SharedKeys.email, value: value.data["data"]["user"]["email"]);
      emit(SuccessLoginState());
    }).catchError((error){
      print(error.response.data.toString());
      emit(ErrorLoginState());
      throw error;
    });
}



}