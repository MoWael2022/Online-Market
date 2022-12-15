import "package:flutter/material.dart";
import 'package:hr_task/constants/constant.dart';
import 'package:hr_task/cubit/app_cubit.dart';
import 'package:hr_task/cubit/app_state.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pages/AboutPage.dart';
import '../pages/Home.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import '../pages/categoryPage.dart';
import '../pages/productpayment.dart';
import '../pages/settingpage.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
      builder: (context,state){
        return       Drawer(
          width: 70.w,
          backgroundColor: const Color(0xff323849),
          shape:  RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(60),
              ),
              side: BorderSide(color: BlocProvider.of<AppCubit>(context).drawerColor)),
          child: ListView(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Center(

                child: Text(
                  "Online Market",
                  style: TextStyle(
                      color: BlocProvider.of<AppCubit>(context).drawerColor,
                      fontWeight: FontWeight.w900,

                      fontSize: 10.w
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
                height: 20.h,
                width: 20.h,
                child: Container(
                  decoration: BoxDecoration(
                    color: BlocProvider.of<AppCubit>(context).iconBackgroundDrawer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child:  Center(
                    child: Icon(
                      color: BlocProvider.of<AppCubit>(context).drawerColor,
                      Icons.shopping_bag_rounded,
                      size: 100,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              ListTile(
                leading:  Icon(
                  color: BlocProvider.of<AppCubit>(context).drawerColor,
                  Icons.home,
                  size: 35,
                ),
                title:  Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 25,
                    color: BlocProvider.of<AppCubit>(context).drawerColor,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
              ),
              ListTile(
                leading:  Icon(
                  color: BlocProvider.of<AppCubit>(context).drawerColor,
                  Icons.category,
                  size: 35,
                ),
                title:  Text(
                  "Categories",
                  style: TextStyle(
                    color:BlocProvider.of<AppCubit>(context).drawerColor,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
              ),
              ListTile(
                leading:  Icon(
                  color: BlocProvider.of<AppCubit>(context).drawerColor,
                  Icons.payment,
                  size: 35,
                ),
                title:  Text(
                  "Payment",
                  style: TextStyle(
                    color: BlocProvider.of<AppCubit>(context).drawerColor,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Payment();
                  }));
                },
              ),
              ListTile(
                leading:  Icon(
                  color: BlocProvider.of<AppCubit>(context).drawerColor,
                  Icons.settings,
                  size: 35,
                ),
                title:  Text(
                  "Setting",
                  style: TextStyle(
                    color:BlocProvider.of<AppCubit>(context).drawerColor,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Setting() ;
                  }));
                },
              ),
              ListTile(
                leading:  Icon(
                  color:BlocProvider.of<AppCubit>(context).drawerColor,
                  Icons.description,
                  size: 35,
                ),
                title:  Text(
                  "About",
                  style: TextStyle(
                    color: BlocProvider.of<AppCubit>(context).drawerColor,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return AboutPage();
                  }));
                },
              ),
            ],
          ),
        );
      }

    );
  }
}
