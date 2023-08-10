import 'package:elearning_app/Bloc/Layout_cubit/layout_cubit.dart';
import 'package:elearning_app/Constant.dart';
import 'package:elearning_app/modules/Forgetten%20password.dart';
import 'package:elearning_app/modules/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Cubit/learn_cubit.dart';
import '../shared/shared_component.dart';
import 'Courses_screen.dart';
import 'CreateAccount_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Layout_screen/layout.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  var Formkey=GlobalKey<FormState>();
  var OldPasswordController=TextEditingController();
  var NewPasswordController=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LayoutCubit,LayoutState>(
      builder:(context, state) {
        var cubit=context.read<LayoutCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 50,
            titleSpacing: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "Change Password",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            titleTextStyle:
            TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppbarAndStatusColor,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: AppbarAndStatusColor,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: Formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170.0,left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Old Password",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(height: 15,),
                      buildTextFormField(hint: "**************",
                          obscure: true,
                          validator: (value){
                            return null;
                          },
                          icon: CupertinoIcons.lock_fill,controller:
                          OldPasswordController),
                      SizedBox(height: 20,),
                      Text("New Password",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(height: 15,),
                      buildTextFormField(hint: "**************",
                          validator: (value){
                            return null;
                          },
                          icon: CupertinoIcons.lock_fill,
                          controller: NewPasswordController,obscure: true),
                    ],
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(right: 357,top: 100),
                    child: Image.asset("images/Ellipse 5.png"),
                  ),
                  SizedBox(height: 100,),
                  state is ResetPasswordLoadingState?
                  CircularProgressIndicator(
                    color:Color.fromRGBO(0, 107, 182, 1),
                  )
                      :buildElevatedButton(text:
                  "Change Password",
                      onpress: (){
                        if(Formkey.currentState!.validate()) {
                          cubit.ResetPassword(oldPassword: OldPasswordController.text,
                              Newpassword: NewPasswordController.text);
                        }
                      }),

                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {

        if ( state is ResetPasswordSuccessState)
        {
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            backgroundColor: colorgreen,
            content: Text(state.message),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 30,
              bottom: MediaQuery.of(context).size.height -100,
            ),
          ));
        }
        else if(state is FaildResetPasswordDataState){
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 30,
              bottom: MediaQuery.of(context).size.height -100,
            ),
          ));
        }
      },
    );
  }


}
