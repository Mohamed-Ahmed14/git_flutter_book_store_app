import 'package:book_store/view/screens/auth_screens/login_screen.dart';
import 'package:book_store/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/auth_cubit/auth_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AuthCubit,AuthState>(
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(15),
              children: [
                Image.asset(
                  "assets/images/book_logo2.png",
                  width: 140,
                  height: 120,
                ),
                Center(
                  child: Text(
                    "Join Us!",
                    style: TextStyle(
                      color: Colors.teal[400],
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Already have an accunt? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),),(route) => false,);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.teal[400],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal[400]!, width: 2),
                  ),
                  child: Form(
                    key: cubit.formKeyR,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: cubit.nameController,
                          validator: (value){
                            if(value == "")
                              {
                                return "Enter your name";
                              }
                            return null;
                          },
                          cursorColor:Colors.teal[400],
                          decoration: InputDecoration(
                              hintText:"Name",
                              prefixIcon: Icon(Icons.person,color: Colors.teal[400],),
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
                        SizedBox(height: 5,),
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
                        SizedBox(height: 5,),
                        TextFormField(
                          controller: cubit.passwordController,
                          validator: (value){
                            if(value == "")
                            {
                              return "Enter your password";
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
                        SizedBox(height: 5,),
                        TextFormField(
                          controller: cubit.confirmedPasswordController,
                          validator: (value){
                            if(value == "")
                            {
                              return "Enter your confirmed password";
                            }
                            else if(value.toString() != cubit.passwordController.text)
                              {
                                return "Password not confirmed";
                              }
                            return null;
                          },
                          cursorColor:Colors.teal[400],
                          obscureText: cubit.obscureText,
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
                        SizedBox(height: 5,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[400],
                                fixedSize: Size(320,45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                            ),
                            onPressed:(){
                              if(cubit.formKeyR.currentState!.validate())
                                {
                                  cubit.register().then((value){
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),),(route) => false,);
                                  });

                                }
                            },
                            child: Text("Register",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),)
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
