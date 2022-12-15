import "package:flutter/material.dart";
import 'package:hr_task/constants/constant.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/drawerlist.dart';
import 'categoryPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: SizedBox(
          height: 100.h,
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/shop.png"),
                  opacity: 0.6,
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7.w, bottom: 3.h),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      """Online Market""",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7.w, right: 45.w),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      """succsess is not always about greatness.it is about cosistency consistent hard work gains success greatness will come!.""",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 7.w, top: 4.h),
                      child: SizedBox(
                        height: 7.h,
                        child: ElevatedButton(
                          // style: ElevatedButton.styleFrom(
                          //   primary: Colors.orangeAccent
                          // ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orangeAccent),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                          },
                          child: Text("Shop Now"),
                        ),
                      )),
                ],
              )),
        ),
      ),
      backgroundColor: Color(0xff070f1f),
      drawer: SafeArea(
        child: DrawerList(),
      ),
    );
  }
}
