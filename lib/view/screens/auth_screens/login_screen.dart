import 'package:book_store/view/screens/auth_screens/register_screen.dart';

import 'package:book_store/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/auth_cubit/auth_state.dart';
import '../../component/auth/login_form.dart';
import '../home_screen/home_screen.dart';
import '../layout_screen/layout_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(15),
          children: [
            Image.asset(
              "assets/images/book_logo2.png",
              width: 160,
              height: 140,
            ),
            SizedBox(height: 10,),
            Center(
              child: Text(
                "Login now!",
                style: TextStyle(
                  color: Colors.teal[400],
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Don't have an accunt? ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(2),
                      elevation: 0,
                      backgroundColor: Colors.greenAccent[100],
                      fixedSize: Size(140, 40),
                      //foregroundColor: Colors.green[800],
                    ),
                    onPressed: () {
                      AuthCubit.get(context).reset();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RegisterScreen(),),(route) => false,);
                    },
                    child: Text(
                      "Register Now!",
                      style: TextStyle(
                          color: Colors.teal[400],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal[400]!, width: 2),
              ),
              child: LoginForm(),
            ),
          ],
        ),

        ),

    );
  }
}
