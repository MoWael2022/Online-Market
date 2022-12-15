import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_task/cubit/app_cubit.dart';
import 'package:hr_task/cubit/app_state.dart';
import 'package:hr_task/models/products%20model.dart';
import 'package:sizer/sizer.dart';

import '../constants/constant.dart';
import 'ShowDescription.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: BlocProvider.of<AppCubit>(context).cardItemColor,
            ),
            child: ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          product.title,
                        ),
                        content: ShowDescription(
                          products: product,
                          title: product.title,
                          brand: product.brand,
                          Image: product.Image,
                          description: product.description,
                          stock: product.stock,
                          rate: product.rate,
                          discount: product.discountPercentage,
                          price: product.price.toString(),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel")),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AppCubit>(context)
                                    .decrement(product);
                                Navigator.of(context).pop();
                              },
                              child: const Text("Remove")),

                        ],
                      );
                    });
              },
              trailing: Text("\$ ${product.price}"),
              leading: SizedBox(
                height: 10.h,
                width: 10.h,
                child: Image(
                  image: NetworkImage(product.Image),
                  fit: BoxFit.fill,
                ),
              ),
              title: Wrap(
                children: [
                  Text(product.title),
                ],
              ),
              subtitle: Wrap(
                children: [
                  Text(product.brand),
                ],
              ),
            ),
          );
        });
  }
}
