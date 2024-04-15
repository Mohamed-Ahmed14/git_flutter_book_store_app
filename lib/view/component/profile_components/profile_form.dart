import 'package:book_store/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:ProfileCubit.get(context).formColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                labelText: "name",
                labelStyle: TextStyle(color: Colors.teal),
                alignLabelWithHint: true,
                enabled: ProfileCubit.get(context).isEditPressed,
                prefixIcon: Icon(Icons.person,color: Colors.teal,),
              ),
              showCursor: ProfileCubit.get(context).isEditPressed,
              cursorColor: Colors.teal,
              controller: ProfileCubit.get(context).profileNameController,
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                labelText: "email",
                labelStyle: TextStyle(color: Colors.teal),
                alignLabelWithHint: true,
                // enabled: ProfileCubit.get(context).isEditPressed,
                enabled: false,
                prefixIcon: Icon(Icons.email_rounded,color: Colors.teal,),
              ),
              showCursor: ProfileCubit.get(context).isEditPressed,
              cursorColor: Colors.teal,
              controller: ProfileCubit.get(context).profileEmailController,
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                labelText: "phone",
                labelStyle: TextStyle(color: Colors.teal),
                alignLabelWithHint: true,
                enabled: ProfileCubit.get(context).isEditPressed,
                prefixIcon: Icon(Icons.phone,color: Colors.teal,),
              ),
              showCursor: ProfileCubit.get(context).isEditPressed,
              cursorColor: Colors.teal,
              controller: ProfileCubit.get(context).profilePhoneController,
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                labelText: "city",
                labelStyle: TextStyle(color: Colors.teal),
                alignLabelWithHint: true,
                enabled: ProfileCubit.get(context).isEditPressed,
                prefixIcon: Icon(Icons.location_city_outlined,color: Colors.teal,),
              ),
              showCursor: ProfileCubit.get(context).isEditPressed,
              cursorColor: Colors.teal,
              controller: ProfileCubit.get(context).profileCityController,
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                labelText: "address",
                labelStyle: TextStyle(color: Colors.teal),
                alignLabelWithHint: true,
                enabled: ProfileCubit.get(context).isEditPressed,
                prefixIcon: Icon(Icons.location_on_sharp,color: Colors.teal,),
              ),
              showCursor: ProfileCubit.get(context).isEditPressed,
              cursorColor: Colors.teal,
              controller: ProfileCubit.get(context).profileAddressController,

            ),
            SizedBox(height: 10,),
          ],
        ),
    );


  }
}
