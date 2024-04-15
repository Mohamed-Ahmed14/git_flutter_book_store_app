import 'package:bloc/bloc.dart';
import 'package:book_store/model/profile_model/profile_model.dart';
import 'package:book_store/view_model/cubit/profile_cubit/profile_state.dart';
import 'package:book_store/view_model/data/network/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitState());
  static ProfileCubit get(context)=>BlocProvider.of<ProfileCubit>(context);

  TextEditingController profileNameController = TextEditingController();
  TextEditingController profileEmailController = TextEditingController();
  TextEditingController profilePhoneController = TextEditingController();
  TextEditingController profileCityController = TextEditingController();
  TextEditingController profileAddressController = TextEditingController();



  GlobalKey<FormState> profileKey = GlobalKey<FormState>();


  //get profile data
  ProfileModel? profileModel;

  Future<void> showProfile()async{
    emit(ShowProfLoadingState());
    await DioHelper.get(endPoint: "profile",
    withToken: true).then((value){
      profileModel = ProfileModel.fromJson(value.data);
      setProfDataToCont();
      emit(ShowProfSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShowProfErrorState());
      throw error;
    });
  }
  void setProfDataToCont(){
    if(profileModel?.data?.name == null)
      {
        profileNameController.text = "";
      }else
        {
          profileNameController.text = profileModel!.data!.name!;
        }
    if(profileModel?.data?.email == null)
    {
      profileEmailController.text = "";
    }else
    {
      profileEmailController.text = profileModel!.data!.email!;
    }
    if(profileModel?.data?.phone == null)
    {
      profilePhoneController.text = "";
    }else
    {
      profilePhoneController.text = profileModel!.data!.phone!;
    }
    if(profileModel?.data?.city == null)
    {
      profileCityController.text = "";
    }else
    {
      profileCityController.text = profileModel!.data!.city!;
    }
    if(profileModel?.data?.address == null)
    {
      profileAddressController.text = "";
    }else
    {
      profileAddressController.text = profileModel!.data!.address!;
    }
  }

  //Edit Profile Form
  bool isEditPressed = false;
  Color? formColor = Colors.grey[200];

  void changeFormStatus(){
    isEditPressed = !isEditPressed;
    if(isEditPressed)
      {
        formColor = Colors.grey[300];
      }
    else{
      formColor = Colors.grey[200];
    }
    emit(ChangeFormState());
  }


  Future<void> editProfile() async{

    emit(EditProfileLoadingState());
    await DioHelper.post(endPoint: "update-profile",
    withToken: true,
      body:{
      "name": profileNameController.text,
        "phone":profilePhoneController.text,
        "city":profileCityController.text,
        "address":profileAddressController.text,
      }
    ).then((value){
      print(value.data["message"]);
      profileModel = ProfileModel.fromJson(value.data);
      setProfDataToCont();
      emit(EditProfileSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(EditProfileErrorState());
      throw error;
    });
  }
  
  //update password
  TextEditingController profilePassCont = TextEditingController();
  TextEditingController profileNewPassCont = TextEditingController();
  TextEditingController profileConfNewPassCont = TextEditingController();
  
  GlobalKey<FormState> updatePassKey = GlobalKey<FormState>();

  bool profileObscureText=true;

  void changeProfObscure()
  {
    profileObscureText=!profileObscureText;
    emit(ChangeProfObscureSuccessState());
  }

  void resetPassController(){
    profilePassCont.clear();
    profileNewPassCont.clear();
    profileConfNewPassCont.clear();
  }
  
  Future<void> changePassword() async{
    emit(ChangePassLoadingState());
    await DioHelper.post(endPoint: "update-password",
    withToken: true,
    body: {
      "current_password" : profilePassCont.text,
      "new_password" : profileNewPassCont.text,
      "new_password_confirmation" : profileConfNewPassCont.text,
    }).then((value) {
      print(value.data["message"]);
      emit(ChangePassSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ChangePassErrorState());
      throw error;
    });
  }

  bool isFromDrawer = false;


  //logout
  Future<void> logout() async{
    emit(LogoutLoadingState());
    await DioHelper.post(endPoint: "logout",
    withToken: true).then((value){
      print(value.data["message"]);
      emit(LogoutSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(LogoutErrorState());
      throw error;
    });
  }

}