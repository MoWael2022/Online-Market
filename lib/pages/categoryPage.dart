import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_task/Api%20data/categoriesData.dart';
import 'package:hr_task/cubit/app_cubit.dart';
import 'package:hr_task/models/categories%20model.dart';
import 'package:hr_task/pages/productpayment.dart';
import 'package:hr_task/widgets/cards.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import '../constants/constant.dart';
import '../cubit/app_state.dart';
import '../widgets/drawerlist.dart';
import '../widgets/search.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          return Scaffold(
            drawer: DrawerList(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(10.h),
              child: AppBar(

                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15) ),
                ),

                title: Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 7.w,
                      fontFamily: "nice",
                      fontWeight: FontWeight.w300,
                    //color: BlocProvider.of<AppCubit>(context).mainColor
                  ),
                ),

                elevation: 0,
                backgroundColor: BlocProvider.of<AppCubit>(context).appbarColor,
                actions: [
                  IconButton(
                    iconSize: 4.h,
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(context: context, delegate: SearchData());
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 4.0.w),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_cart_checkout),
                          iconSize: 4.h,
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Payment();
                            }));
                          },
                        ),
                        Text("${BlocProvider.of<AppCubit>(context).counter}"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: BlocProvider.of<AppCubit>(context).mainColor,
            body: FutureBuilder(
                future: FetchCategoriesData.Categoriesdata(),
                builder: (context, snapshot) {
                  List<Categories>? categories = snapshot.data;
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(2.h, 0.h, 2.h, 0),
                      child: ListView.builder(
                          itemCount: categories!.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                Center(
                                  child: Cards(
                                    page_name:
                                        categories![i].nameCatigories,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                )
                              ],
                            );
                          }),
                    );
                  } else if (snapshot.hasError)  {
                    return AlertDialog(
                      title: const Text("Error"),
                      content: const Text(
                          """please check the internet """
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return Home();
                              })) ;
                            }, child: Text("Rety")),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );
        },
        listener: (context, state) {},
      ),
    );
  }



}
