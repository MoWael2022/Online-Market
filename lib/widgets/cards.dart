// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_task/cubit/app_state.dart';
import 'package:sizer/sizer.dart';
import 'package:hr_task/constants/constant.dart';
import '../cubit/app_cubit.dart';
import '../pages/products page.dart';

class Cards extends StatefulWidget {
  Cards({
    Key? key,
    required this.page_name,
  }) : super(key: key);
  String page_name;

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  String getpicture() {
    String picture = 'nothing';
    if (widget.page_name == "smartphones") {
      picture = photo.smartphones;
    }
    if (widget.page_name == "laptops") {
      picture = photo.laptops;
    }
    if (widget.page_name == "fragrances") {
      picture = photo.fragrances;
    }
    if (widget.page_name == "skincare") {
      picture = photo.skincare;
    }
    if (widget.page_name == "groceries") {
      picture = photo.groceries;
    }
    if (widget.page_name == "home-decoration") {
      picture = photo.home_decoration;
    }
    if (widget.page_name == "furniture") {
      picture = photo.furniture;
    }
    if (widget.page_name == "tops") {
      picture = photo.tops;
    }
    if (widget.page_name == "womens-dresses") {
      picture = photo.womens_dresses;
    }
    if (widget.page_name == "mens-shirts") {
      picture = photo.mens_shirts;
    }
    if (widget.page_name == "mens-shoes") {
      picture = photo.mens_shoes;
    }
    if (widget.page_name == "mens-watches") {
      picture = photo.mens_watches;
    }
    if (widget.page_name == "womens-watches") {
      picture = photo.womens_watches;
    }
    if (widget.page_name == "womens-bags") {
      picture = photo.womens_bags;
    }
    if (widget.page_name == "womens-jewellery") {
      picture = photo.womens_jewellery;
    }
    if (widget.page_name == "sunglasses") {
      picture = photo.sunglasses;
    }
    if (widget.page_name == "automotive") {
      picture = photo.automotive;
    }
    if (widget.page_name == "motorcycle") {
      picture = photo.motorcycle;
    }
    if (widget.page_name == "lighting") {
      picture = photo.lighting;
    }
    if (widget.page_name == "womens-shoes") {
      picture = photo.womanShoes;
    }
    return picture;
  }

  // Future<String?> Getpicture()async{
  double numofOpacity = 0.7;
  double height = 20.h;
  double width = 90.w;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){},
      builder: (context,state){
        return InkWell(
            onTapUp: (val) {
              setState(() {
                numofOpacity = 1;
                height = 21.h;
                width = 95.w;
              });
            },
            onTapDown: (val) {
              setState(() {
                numofOpacity = 1;
                height = 21.h;
                width = 95.w;
              });
            },
            onTapCancel: () {
              setState(() {
                numofOpacity = .7;
                height = 20.h;
                width = 90.w;
              });
            },
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ProductsPage(product_name: widget.page_name);
              }));
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(getpicture()),

                    fit: BoxFit.cover,
                    opacity: numofOpacity),
              ),
              height: height,
              width: width,
              child: Center(
                  child: Text(
                    widget.page_name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  )),
            ));
      },

    );
  }
}
