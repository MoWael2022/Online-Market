import 'package:flutter/material.dart';
import 'package:hr_task/cubit/app_state.dart';
import "package:animated_splash_screen/animated_splash_screen.dart";
import 'package:hr_task/pages/splashscreen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Api data/categoriesData.dart';
import 'cubit/app_cubit.dart';
import 'pages/categoryPage.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return AppCubit();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, oriantaion, devicetype) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Market',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          //"smartphones" : (context)=>SmartphonesPage(),
        },
        home: Splash(),
        // AnimatedSplashScreen(
        //     splash: Icons.home_outlined,
        //     duration: 4000,
        //     splashTransition: SplashTransition.fadeTransition,
        //     nextScreen: Home(),
        // ),
      );
    });
  }
}
