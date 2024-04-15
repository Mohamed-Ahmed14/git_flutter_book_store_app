import 'package:book_store/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:book_store/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/profile_cubit/profile_state.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_outlined,color: Colors.black,size: 30,),),
        title: Text("Change Password",style: TextStyle(
          color: Colors.teal,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(15),
        child: BlocBuilder<ProfileCubit,ProfileState>(
          builder: (context, state) {
            var cubitAuth = AuthCubit.get(context);
            var cubitProf = ProfileCubit.get(context);
            return Form(
              key: cubitProf.updatePassKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: cubitProf.profilePassCont,
                    validator: (value){
                      if(value == "" || value.toString() != cubitAuth.passwordController.text)
                      {
                        return "Password not correct";
                      }
                      return null;
                    },
                    cursorColor:Colors.teal[400],
                    obscureText: cubitProf.profileObscureText,
                    decoration: InputDecoration(
                        hintText:"Current Password",
                        prefixIcon: Icon(Icons.lock_rounded,color: Colors.teal[400],),
                        suffixIcon: IconButton(
                          icon:cubitProf.profileObscureText? Icon(Icons.visibility_off_rounded,color: Colors.teal[400],):
                          Icon(Icons.visibility_rounded,color: Colors.teal[400],),
                          onPressed: (){
                            cubitProf.changeProfObscure();
                          },
                        ),
                        contentPadding: EdgeInsets.all(1),
                        hintStyle: TextStyle(
                            color: Colors.teal[400]
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ))
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: cubitProf.profileNewPassCont,
                    validator: (value){
                      if(value == "")
                      {
                        return "Enter your New password";
                      }
                      else if(value.toString().length<8)
                      {
                        return "The new password must be at least 8 characters";
                      }
                      return null;
                    },
                    cursorColor:Colors.teal[400],
                    obscureText: cubitProf.profileObscureText,
                    decoration: InputDecoration(
                        hintText:"New Password",
                        prefixIcon: Icon(Icons.lock_rounded,color: Colors.teal[400],),
                        contentPadding: EdgeInsets.all(1),
                        hintStyle: TextStyle(
                            color: Colors.teal[400]
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ))
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: cubitProf.profileConfNewPassCont,
                    validator: (value){
                      if(value == "")
                      {
                        return "Enter your Confirmed password";
                      }
                      else if(value.toString() != cubitProf.profileNewPassCont.text)
                      {
                        return "The confirmed password must match";
                      }
                      return null;
                    },
                    cursorColor:Colors.teal[400],
                    obscureText: cubitProf.profileObscureText,
                    decoration: InputDecoration(
                        hintText:"Confirm Password",
                        prefixIcon: Icon(Icons.lock_rounded,color: Colors.teal[400],),
                        contentPadding: EdgeInsets.all(1),
                        hintStyle: TextStyle(
                            color: Colors.teal[400]
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ))
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[400],
                          fixedSize: Size(320,45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      onPressed:(){
                        print(cubitAuth.passwordController.text);
                        if(cubitProf.updatePassKey.currentState!.validate())
                        {
                          cubitProf.changePassword();
                          cubitProf.resetPassController();
                        }
                      },
                      child: Text("Change Password",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),)
                  ),
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}
