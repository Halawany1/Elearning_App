import 'package:elearning_app/Bloc/Cubit/learn_cubit.dart';
import 'package:elearning_app/Bloc/Layout_cubit/layout_cubit.dart';
import 'package:elearning_app/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/shared_component.dart';
import 'CreateAccount_screen.dart';

class ForgettenPassScreen extends StatelessWidget {
   ForgettenPassScreen({super.key});
   var EmailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutState>(
      listener:(context, state) {
      },
      builder: (context, state) {
        var cubit=context.read<LayoutCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 310.0),
                      child: Image.asset("images/Ellipse 4.png"),
                    ),
                  ],
                ),

                Image.asset("images/Group 19.png"),
                SizedBox(height: 30,),
                Text(
                  "Forgot",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10,),
                Text(
                  "Your Password?",
                  style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF242424)),
                ),
                SizedBox(height: 35,),
                Text(
                  "Enter your email below to receive your\n "
                      "\t\t\t\t\t\t\t\tpassword reset instruction",
                  style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFCDCDCD)),
                ),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 0,
                          top: 45,
                          child: Image.asset("images/Ellipse 5.png")),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: buildTextFormField(hint: "E-mail Address",
                            validator: (value){
                              return null;
                            },
                            icon: CupertinoIcons.mail_solid,
                            controller: EmailController),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70,),
                buildElevatedButton(text: "SEND",onpress: (){
                }),
              ],
            ),
          ),
        );
      },
    );
  }


}
