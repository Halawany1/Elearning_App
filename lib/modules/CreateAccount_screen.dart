import 'package:csc_picker/csc_picker.dart';
import 'package:elearning_app/Bloc/Cubit/learn_cubit.dart';
import 'package:elearning_app/Constant.dart';
import 'package:elearning_app/modules/Courses_screen.dart';
import 'package:elearning_app/modules/Layout_screen/layout.dart';
import 'package:elearning_app/modules/home_screen.dart';
import 'package:elearning_app/modules/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/shared_component.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});
  var Formkey = GlobalKey<FormState>();
  var NameController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();
  var PhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LearnCubit, LearnState>(
      builder: (context, state) {
        var cubit = context.read<LearnCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 50,
            titleSpacing: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "Create An Account",
              style: TextStyle(
                  fontSize: 25,
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Image.asset("images/Group 19.png"),
                        SizedBox(
                          height: 50,
                        ),
                        buildTextFormField(
                            hint: "Full Name",
                            icon: CupertinoIcons.person_solid,
                            controller: NameController,
                            validator: (value) {
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                            hint: "E-mail Address",
                            icon: Icons.email,
                            controller: EmailController,
                            validator: (value) {
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                            hint: "Password",
                            icon: CupertinoIcons.lock_fill,
                            controller: PasswordController,
                            obscure: true,
                            validator:(value) {

                                return null;

                            }),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                            hint: "Confirm Password",
                            obscure: true,
                            icon: CupertinoIcons.lock_fill,
                            controller: ConfirmPasswordController,
                            validator: (value) {
                                return null;

                            }),
                      ],
                    ),
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
                            hint: "Phone",
                            controller: PhoneController,
                            validator: (value) {
                                return null;
                            },
                            icon: Icons.phone,
                          ),
                        ),
                      ],
                    ),
                  ),

                  state is RegisterLoadingState?CircularProgressIndicator(
                    color:Color.fromRGBO(0, 107, 182, 1),
                  )
                      :buildElevatedButton(text:
                  "Select Interests",
                      onpress: (){
                        if(Formkey.currentState!.validate()) {
                          cubit.register(email: EmailController.text,
                              password: PasswordController.text,
                               name: NameController.text,
                              phone: PhoneController.text);

                        }
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>
                              LoginScreen(),));
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (state is FailedToRegisterState) {
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
