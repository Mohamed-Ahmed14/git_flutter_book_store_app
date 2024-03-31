import 'package:book_store/view/screens/auth_screens/login_screen.dart';
import 'package:book_store/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/auth_cubit/auth_state.dart';
import '../../component/auth/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
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
                      AuthCubit.get(context).reset();
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
              child: RegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}
