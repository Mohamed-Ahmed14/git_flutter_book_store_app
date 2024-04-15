import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/auth_cubit/auth_cubit.dart';
import '../../../view_model/cubit/auth_cubit/auth_state.dart';
import '../../screens/layout_screen/layout_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cubit.emailController,
                validator: (value){
                  if(value == "")
                  {
                    return "Enter your email";
                  }
                  return null;
                },
                cursorColor:Colors.teal[400],
                decoration: InputDecoration(
                    hintText:"Email",
                    prefixIcon: Icon(Icons.email_rounded,color: Colors.teal[400],),
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
                controller: cubit.passwordController,
                validator: (value){
                  if(value == "")
                  {
                    return "Enter Your password";
                  }
                  return null;
                },
                cursorColor:Colors.teal[400],
                obscureText: cubit.obscureText,
                decoration: InputDecoration(
                    hintText:"Password",
                    prefixIcon: Icon(Icons.lock_rounded,color: Colors.teal[400],),
                    suffixIcon: IconButton(
                      icon:cubit.obscureText? Icon(Icons.visibility_off_rounded,color: Colors.teal[400],):
                      Icon(Icons.visibility_rounded,color: Colors.teal[400],),
                      onPressed: (){
                        cubit.changeObscure();
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[400],
                      fixedSize: Size(320,45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  onPressed:(){
                    if(cubit.formKey.currentState!.validate())
                    {
                      cubit.login().then((value){
                        Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => LayoutScreen(),),
                              (route) => false,);
                      });
                    }
                  },
                  child: Text("Login",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),)
              ),
            ],
          ),
        );
      },
    );
  }
}
