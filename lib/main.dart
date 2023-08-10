import 'package:elearning_app/Bloc/Cubit/learn_cubit.dart';
import "package:elearning_app/Bloc/Layout_cubit/layout_cubit.dart";
import "package:elearning_app/modules/onboarding_screen.dart";
import 'package:flutter/material.dart';
import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:page_transition/page_transition.dart";

import "Constant.dart";
import "Helper/bloc_observer.dart";

import "Network/local_netwok/local.dart";
import "modules/StartScreen.dart";
import 'modules/Layout_screen/layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
 token = await CacheNetwork.getCacheData(key: 'token');
  debugPrint("token is : $token");
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LearnCubit(),),
        BlocProvider(create: (context) => LayoutCubit()..getUserData(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color.fromRGBO(0, 107, 182, 1),
                statusBarIconBrightness: Brightness.light),
            )
          ),
          home:
          Stack(children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child:
              Image(image: AssetImage("images/screen1.png"), fit: BoxFit.cover),
            ),
            AnimatedSplashScreen(
              splashIconSize: 200,
              animationDuration:Duration(seconds : 1) ,
              backgroundColor: Colors.white.withOpacity(0),
              pageTransitionType: PageTransitionType.fade,
              splashTransition: SplashTransition.scaleTransition,
              splash: Container(
                  height: 183,
                  width: 135,
                  child: Column(
                    children: [
                      Image(image: AssetImage("images/Group 19.png"),
                          fit: BoxFit.cover),
                    ],
                  )),
              nextScreen: token != null ? LayoutScreen() : StartScreen(),
            ),
          ])
      ),
    );
  }
}
