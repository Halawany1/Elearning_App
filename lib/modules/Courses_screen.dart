
import 'package:elearning_app/Bloc/Cubit/learn_cubit.dart';
import 'package:elearning_app/modules/CreateAccount_screen.dart';
import 'package:elearning_app/modules/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../shared/shared_component.dart';

class CoursesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearnCubit,LearnState>(
      builder: (context, state) {
        var cubit=context.read<LearnCubit>();
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            titleSpacing: 20,
            backgroundColor: Color.fromRGBO(0, 107, 182, 1),
            elevation: 0,
            title: Text(
              "Your Interests",
              style: TextStyle(
                  color:Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: Container(
              padding:EdgeInsets.only(left: 30,right: 27,top:25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search,color: Colors.black,),
                        hintText: "Search for anything",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(160, 165, 189, 1),
                            fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                          //   color:  Color.fromRGBO(245, 245, 247, 1),
                        ),
                        fillColor: Color.fromRGBO(245, 245, 247, 1),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 17),
                    Text(
                      "Select Interests",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        //  margin: EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  buildStack(
                                    cubit: cubit,
                                    index: 0,
                                    image1:
                                    Image.asset("images/Mask Group (6).png"),
                                    text1: "Comics History",
                                    text2: "17 Courses",
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  buildStack(
                                    cubit: cubit,
                                    index: 1,
                                    image1:
                                    Image.asset("images/Mask Group (7).png"),
                                    text1: "Ancient Greece",
                                    text2: "13 Courses",
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  buildStack(
                                    cubit: cubit,
                                    index: 2,
                                    image1: Image.asset("images/Mask Group.png"),
                                    text1: "Photography",
                                    text2: "17 Courses",
                                  ),
                                ],
                              ),
                              SizedBox(width: 30,),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    buildStack(
                                      cubit: cubit,
                                      index: 3,
                                      image1:
                                      Image.asset("images/Mask Group (5).png"),
                                      text1: "UX Design",
                                      text2: "25 Courses",
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    buildStack(
                                      cubit: cubit,
                                      index: 4,
                                      image1:
                                      Image.asset("images/Mask Group (4).png"),
                                      text1: "History of Wine",
                                      text2: "20 Courses",
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    buildStack(
                                      cubit: cubit,
                                      index: 5,
                                      image1:
                                      Image.asset("images/Mask Group (2).png"),
                                      text1: "Art Cooking",
                                      text2: "13 Courses",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 50),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildElevatedButton(
                                  text: "Let’s Get Started",
                                onpress:(cubit.select[0]||cubit.select[1]
                              ||cubit.select[2]||cubit.select[3]||
                                    cubit.select[4]||cubit.select[5]) ?(){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
                                    (context) => CreateAccountScreen(),));

                        }:null,
                              ),
                              SizedBox(
                                height: 10,
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
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder:
                                        (context) => LoginScreen(),)
                                      );
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
                              SizedBox(height: 30)
                            ])),
                  ],
                ),
              )));}
    );
  }


}
