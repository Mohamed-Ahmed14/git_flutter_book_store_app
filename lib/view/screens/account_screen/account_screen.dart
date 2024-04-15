


import 'package:book_store/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:book_store/view_model/cubit/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/profile_components/profile_form.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AcountScreenState();
}

class _AcountScreenState extends State<AccountScreen> {

  @override
  void initState() {
    // TODO: implement initState
    ProfileCubit.get(context).showProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Visibility(
          visible: state is! ShowProfLoadingState,
          replacement: Center(child: CircularProgressIndicator(),),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 240,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(180, 60)
                            )
                        ),
                        child:cubit.isEditPressed?
                        Align(alignment:AlignmentDirectional.centerStart, child: Row(
                          children: [
                            IconButton(onPressed: (){
                              if(cubit.isFromDrawer)
                                {
                                  cubit.isFromDrawer=false;
                                  cubit.isEditPressed = false;
                                  Navigator.pop(context);
                                }else{
                                cubit.changeFormStatus();
                              }
                            }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30,)),
                            SizedBox(width: 80,),
                            Text("Update",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35
                            ),),
                          ],
                        )):
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(width: 120,),
                            Expanded(
                              child: Text("Profile",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35
                              ),),
                            ),
                            Icon(Icons.login_outlined,color: Colors.white,size: 35,),
                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                      PositionedDirectional(
                        bottom: -75,
                        start: MediaQuery.of(context).size.width/2 - 80,
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 5,color: Colors.white),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset("assets/images/profile-picture.jpeg",).image,
                              )
                          ),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 75,),

                  ProfileForm(),
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
                      cubit.changeFormStatus();
                      if(!cubit.isEditPressed)
                        {
                          cubit.editProfile();
                        }
                    },
                    child:cubit.isEditPressed?
                    Text("Update",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),):
                    Text("Edit Profile",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                  ),

                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
