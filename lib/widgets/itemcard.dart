import 'dart:ui';
import 'dart:ui';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_task/models/products%20model.dart';
import 'package:sizer/sizer.dart';

import '../constants/constant.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import 'ShowDescription.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.price,
      required this.brand,
      required this.Image,
      required this.stock,
      required this.discount,
      required this.rating,
      required this.products})
      : super(key: key);

  final String title;
  final String description;
  final String price;
  final String brand;
  final dynamic stock;
  final Products products;
  final dynamic discount;
  final dynamic rating;
  final String Image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: 35.h,
              width: 50.w,
              child: Card(
                color: BlocProvider.of<AppCubit>(context).cardItemColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Image(image: Image.network(Uri.parse(Image)),
                      Container(
                        height: 15.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(Image), fit: BoxFit.fill)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 1.w),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 15,
                              color: BlocProvider.of<AppCubit>(context)
                                  .textItemColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 1.w),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          brand,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff434345),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 1.w),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "\$ $price ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: BlocProvider.of<AppCubit>(context)
                                        .textItemColor),
                              ),
                            ),
                            AnimatedContainer(
                                duration: const Duration(microseconds: 10000),
                                height:
                                    BlocProvider.of<AppCubit>(context).height,
                                width: BlocProvider.of<AppCubit>(context).width,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    BlocProvider.of<AppCubit>(context)
                                        .increment(products);
                                  },
                                  backgroundColor:
                                      BlocProvider.of<AppCubit>(context)
                                          .floatButtonColor,
                                  child: const Icon(Icons.add),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 35.w),
              child: IconButton(
                onPressed: () {
                  showDialog(
                      //barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(title),
                          content: ShowDescription(
                            products: products,
                            title: title,
                            brand: brand,
                            Image: Image,
                            description: description,
                            stock: stock,
                            rate: rating,
                            discount: discount,
                            price: price,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel"),
                            ),
                            SizedBox(
                              width: 26.w,
                              child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<
                                        AppCubit>(
                                        context)
                                        .increment(
                                        products);
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text("Add"),
                                      Icon(Icons.add_shopping_cart),
                                    ],
                                  )),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(FontAwesomeIcons.circleInfo),
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
    );
  }
}
