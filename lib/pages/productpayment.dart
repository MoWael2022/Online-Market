import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_task/constants/constant.dart';
import 'package:hr_task/cubit/app_cubit.dart';
import 'package:sizer/sizer.dart';

import '../cubit/app_state.dart';
import 'package:bloc/bloc.dart';

import '../widgets/drawerlist.dart';
import '../widgets/productitem.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: BlocProvider.of<AppCubit>(context).mainColor,
          drawer: DrawerList(),
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            title: const Center(
              child: Text("Payment"),
            ),
            backgroundColor: BlocProvider.of<AppCubit>(context).appbarColor,
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        BlocProvider.of<AppCubit>(context).product.length,
                    itemBuilder: (context, i) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (a) async {
                          BlocProvider.of<AppCubit>(context).decrement(
                              BlocProvider.of<AppCubit>(context).product[i]);
                        },
                        child: Column(
                          children: [
                            ProductItem(
                                product: BlocProvider.of<AppCubit>(context)
                                    .product[i]),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      );
                    }),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff26437d),
                    ),
                    //color: Color(0xff8b1d38),
                    width: double.infinity,
                    height: 10.h,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Total Price",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$ ${BlocProvider.of<AppCubit>(context).Total}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
