import 'package:flutter/material.dart';
import 'package:hr_task/Api%20data/productData.dart';
import 'package:hr_task/pages/productpayment.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constant.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../models/products model.dart';
import '../widgets/drawerlist.dart';
import '../widgets/itemcard.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String product_name;

  // ignore: non_constant_identifier_names
  const ProductsPage({Key? key, required this.product_name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppState>(
            builder: (context, state) {
              return Scaffold(
                drawer: DrawerList(),
                backgroundColor:BlocProvider.of<AppCubit>(context).mainColor,
                appBar: AppBar(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15) ),
                  ),
                  backgroundColor:BlocProvider.of<AppCubit>(context).appbarColor,
                  title: Center(child: Text(product_name)),
                ),
                body: FutureBuilder(
                  future: FetchData.ProductData(product_name),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Products>? data = snapshot.data;
                      if (data == null) {
                        throw Exception("the error here");
                      }
                      return Stack(
                        children: [
                          ListView(
                            children: [
                              Wrap(
                                children: List.generate(data.length, (i) {
                                  return ItemCard(title: data[i].title,
                                      description: data[i].description,
                                      price: data[i].price.toString(),
                                      brand: data[i].brand,
                                      Image: data[i].Image,
                                      stock:data[i].stock,
                                      discount: data[i].discountPercentage,
                                      rating: data[i].rate,
                                      products: data[i]);
                                }),
                              ),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(65.w, 70.h, 0, 0),
                              height: 12.h,
                              width: 12.h,
                              child: FloatingActionButton(
                                  backgroundColor: BlocProvider.of<AppCubit>(context).floatButtonColor,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "${BlocProvider
                                            .of<AppCubit>(context)
                                            .counter}",
                                        style: TextStyle(
                                          fontSize: 3.h,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_shopping_cart,
                                        size: 5.h,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                          return const Payment();
                                        }));
                                  })),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: const Text(
                            """please check the internet """
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return ProductsPage(product_name: product_name);
                                })) ;
                              }, child: Text("Rety")),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              );
            },
            listener: (context, state) {}),

    );
  }
}
