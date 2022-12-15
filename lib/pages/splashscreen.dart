import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_task/widgets/animatedroute.dart';
import 'package:sizer/sizer.dart';

import '../constants/constant.dart';
import 'Home.dart';
import 'categoryPage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navScreen();
  }

  _navScreen() async {
    await Future.delayed(Duration(seconds: 4), () {});
    //ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context, RoutePage(page: HomePage()), (route) => false);
    //Navigator.of(context).push(RoutePage( page : Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Container(
            color: Colors.white,
          ),
          duration: Duration(seconds: 2),
          crossFadeState: CrossFadeState.showSecond,

          secondChild: Container(
            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 5.h),
            child: const Image(
              image: AssetImage("assets/s.png"),
              //color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
