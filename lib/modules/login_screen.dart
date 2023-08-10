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

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  var EmailController=TextEditingController();
   var Formkey=GlobalKey<FormState>();
  var PasswordController=TextEditingController();



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LearnCubit,LearnState>(
      builder:(context, state) {
        var cubit=context.read<LearnCubit>();
       return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,

            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: Formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 370.0),
                    child: Image.asset("images/Ellipse 4.png"),
                  ),

                  Image.asset("images/Group 19.png"),
                  SizedBox(height: 30,),

                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Sign in to your account",
                    style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: buildTextFormField(hint: "E-mail Address",
                        validator: (value){
                          return null;
                        },
                        icon: CupertinoIcons.mail_solid,controller:
                        EmailController),
                  ),
                  Container(
                    width: double.infinity,
                    height: 120,
                    child: Stack(

                      children: [
                        Positioned(
                            left: 0,
                            top: 30,
                            child: Image.asset("images/Ellipse 5.png")),

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: buildTextFormField(hint: "Password",
                              validator: (value){
                                return null;
                              },
                              icon: CupertinoIcons.lock_fill,
                              controller: PasswordController,obscure: true),
                        ),
                        Positioned(
                          top: 95,
                          right: 30,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(

                                  MaterialPageRoute(builder:
                                      (context) => ForgettenPassScreen(),)
                              );
                            },
                            child: Text(
                              "Forgot your password ?",
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFCDCDCD)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  state is LoginLoadingState?CircularProgressIndicator(
                    color:Color.fromRGBO(0, 107, 182, 1),
                  )
                      :buildElevatedButton(text:
                      "LOGIN",
                      onpress: (){
                    if(Formkey.currentState!.validate()) {
                      cubit.login(email: EmailController.text,
                          password: PasswordController.text);

                    }
                  }),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).
                          pushReplacement(MaterialPageRoute
                            (builder:
                              (context) => CreateAccountScreen(),));
                        },
                        child: Text("create".toUpperCase(),
                          style: TextStyle(
                              decorationColor: Colors.grey,
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {

       if ( state is LoginSuccessState )
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LayoutScreen()));
        }
        else if(state is FailedToLoginState){
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
