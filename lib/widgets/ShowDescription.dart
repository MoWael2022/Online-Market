import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_task/constants/constant.dart';
import 'package:hr_task/cubit/app_cubit.dart';
import 'package:sizer/sizer.dart';

import '../cubit/app_state.dart';
import '../models/products model.dart';

class ShowDescription extends StatelessWidget {
  const ShowDescription(
      {Key? key,
      required this.title,
      required this.Image,
      required this.description,
      required this.brand,
        required this.stock,
        required this.rate,
        required this.discount,
      required this.price,
      required this.products})
      : super(key: key);

  final String title;
  final String Image;
  final String description;
  final String brand;
  final dynamic stock;
  final Products products;
  final dynamic rate;
  final dynamic discount;
  final String price;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
      builder: ( context ,state){
      return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 15.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(Image), fit: BoxFit.fill)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "About  ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "brand : $brand",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Stock : $stock",
                  style:  TextStyle(
                    color:BlocProvider.of<AppCubit>(context).textItemColor,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rating : $rate",
                  style:  TextStyle(
                    color: BlocProvider.of<AppCubit>(context).textItemColor,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "discountPercentage : $discount",
                  style:  TextStyle(
                    color:  BlocProvider.of<AppCubit>(context).textItemColor,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Price : \$$price",
                  style:  TextStyle(
                    color: BlocProvider.of<AppCubit>(context).textItemColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );


                }
    );
  }
}
