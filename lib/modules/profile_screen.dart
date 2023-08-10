import 'package:elearning_app/Bloc/Layout_cubit/layout_cubit.dart';
import 'package:elearning_app/modules/ChangePassword_screen.dart';
import 'package:elearning_app/modules/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import '../Bloc/Cubit/learn_cubit.dart';
import '../Constant.dart';
import '../Network/local_netwok/local.dart';
import '../shared/shared_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutState>(
      builder: (context, state) {

        var cubit=context.read<LayoutCubit>();
        return Scaffold(
          body:cubit.userModel != null ? SingleChildScrollView(
            child: Column(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 150,
                            color: Color(0xFFEFEFEF),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: Center(
                              child: ProfilePicture(
                                name: cubit.userModel!.name!,
                                radius: 50,
                                fontsize: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                  SizedBox(
                        height:10,
                      ),
                     Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Column(children: [
                         buildTextFormField(
                           profile: true,
                             readonly: true,
                             hint:cubit.userModel!.name!,
                             icon: CupertinoIcons.person_solid,
                             validator: (value) {
                               return null;
                             }),
                         SizedBox(
                           height: 20,
                         ),
                         buildTextFormField(
                             readonly: true,
                             profile: true,
                             hint: cubit.userModel!.email!,
                             icon: Icons.email,
                             validator: (value) {
                               return null;
                             }),
                         SizedBox(
                           height: 20,
                         ),
                         buildTextFormField(
                             readonly: true,
                             profile: true,
                             hint:"************",
                             icon: CupertinoIcons.lock_fill,
                             validator: (value) {
                               return null;
                             }),
                         SizedBox(
                           height: 20,
                         ),
                         buildTextFormField(
                             readonly: true,
                             profile: true,
                             hint:"************",
                             icon: CupertinoIcons.lock_fill,
                             validator: (value) {
                               return null;
                             }),

                       ],),
                     )

                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 90,
                    padding: EdgeInsets.all(1),
                    child: Stack(
                      children: [
                        Positioned(
                            left: 0,
                            bottom: 10,
                            child: Image.asset("images/Ellipse 5.png")),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: buildTextFormField(
                            readonly: true,
                             profile: true,
                            hint: cubit.userModel!.phone!,
                            validator: (value) {
                              return null;
                            },
                            icon: Icons.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildElevatedButton(text:"Change Password" ,onpress:() {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => ChangePasswordScreen(),));
                  } ),
                  SizedBox(height: 20,),
                  buildElevatedButton(text:"Logout" ,onpress:()async {
                     await CacheNetwork.deleteCacheItem(key: 'token');
                     Navigator.pushReplacement(context, MaterialPageRoute(builder:

                     (context) => LoginScreen(),));
                  } ),
                  SizedBox(height: 20,),

                ]
            ),
          ):
          Center(child: CircularProgressIndicator()),

        );
      },
      listener: (context, state) {

      },
    );
  }
}
class Constants {
  static const String ChangePassword = "Change Password";
  static const String FavoriteCourse = 'FavoriteCourse';
//  static const String Settings = 'Settings';
  static const String LogOut = 'Log out';

  static const List<String> choices = <String>[
  ChangePassword,
  FavoriteCourse,
  LogOut,
  ];

}