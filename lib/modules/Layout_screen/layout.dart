import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:elearning_app/Bloc/Cubit/learn_cubit.dart';
import 'package:elearning_app/modules/Courses_screen.dart';
import 'package:elearning_app/modules/CreateAccount_screen.dart';
import 'package:elearning_app/modules/home_screen.dart';
import 'package:elearning_app/modules/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Bloc/Layout_cubit/layout_cubit.dart';
import '../../Constant.dart';
import '../Favorite_screen.dart';
import '../Search_screen.dart';
import '../profile_screen.dart';



class LayoutScreen extends StatelessWidget {

  final Color changeColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit,LayoutState>(
      builder: (context, state) {
        var cubit=context.read<LayoutCubit>();
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            titleSpacing: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              page[cubit.n],
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
          // backgroundColor: Colors.grey,
          body: PageView(
            onPageChanged: (index) {
              cubit.ChangeSelectScreen(index);

            },
            //physics: NeverScrollableScrollPhysics(),
            controller: cubit.pageController,
            children: [
              HomeScreen(),
              FavouriteScreen(),
              ProfileScreen()
            ],
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: cubit.n,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected:(value) {
              cubit.ChangeSelectScreen(value);
            },
            items: [
              BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: colorblue,
                  inactiveColor: Colors.grey[300]),
              BottomNavyBarItem(
                icon: Icon(Icons.favorite_rounded),
                title: Text('Favorite'),
                inactiveColor: Colors.grey[300],
                activeColor: colorblue,
              ),

              BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                inactiveColor: Colors.grey[300],
                activeColor: colorblue,
              ),
            ],
          ),
        );
      },
    );
  }
}
List page=[
  "Home",
  "Favourite",
  "MY Profile"
];