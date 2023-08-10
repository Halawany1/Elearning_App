import 'package:elearning_app/modules/Courses_screen.dart';
import 'package:elearning_app/modules/CreateAccount_screen.dart';
import 'package:elearning_app/modules/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/shared_component.dart';

class  OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  PageController _controller = PageController();
  bool onLastPage = false;
  bool skip = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              PageView(
                controller: _controller,

                children: [
                  buildSafeArea(
                      image: Image.asset("images/Group 19.png", height: 300,),
                      txt1: "New Classroom Technology",
                      txt2: "It explores progressive approaches to education which are aim to equip students with appropriate skills."),
                  buildSafeArea(image: Image.asset("images/Group 19.png",
                    height: 300,),
                      txt1: "Prior Learning Assesment",
                      txt2: "It allows you to enjoy a more flexible schedule, can reduce the cost of your degree."),
                  buildSafeArea(
                      image: Image.asset("images/Group 19.png", height: 300),
                      txt1: "Career Opportunities",
                      txt2: "It allows you to more easily develop your career alongside furthering your education."),
                ],
              ),
              Container(alignment: Alignment(0, 0.75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      skip ?
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:
                                  (context) {
                                return CoursesScreen();
                              }));
                        },
                        child:
                        Text("Skip",
                          style: TextStyle(
                              color: Color.fromRGBO(141, 177, 27, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),),) :
                      Text("")
                      ,
                      SmoothPageIndicator(controller: _controller, count: 3),
                      onLastPage ?
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return CoursesScreen();
                              }));
                        },
                        child:
                        Text("Done",
                          style: TextStyle(
                              color: Color.fromRGBO(141, 177, 27, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),),) :
                      GestureDetector(
                        onTap: () {
                          if(_controller.page==2){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                                  return CoursesScreen();
                                })); 
                          }
                          _controller.nextPage(
                            duration:
                            Duration(milliseconds: 500), curve: Curves.easeIn,
                          );
                        },
                        child:
                        Text("Next",
                          style: TextStyle(
                              color: Color.fromRGBO(141, 177, 27, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),),),
                    ],
                  )),
            ])
    );
  }

}