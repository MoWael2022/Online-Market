import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hr_task/models/categories%20model.dart';
import 'package:hr_task/models/products%20model.dart';
import 'package:sizer/sizer.dart';
import '../Api data/categoriesData.dart';
import '../constants/constant.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  List<Products> product = [];
  int counter = 0;
  int Total = 0;
  double height = 7.h;
  double width = 7.h;
  String themeColor = "DarkMode";
  bool value =true;
  Color mainColor= color.darkColor;
  Color appbarColor =color.appbarColorDark;
  Color textCardColor =color.textCardColorDark;
  Color drawerColor =color.drawerColorDark;
  Color iconBackgroundDrawer =color.iconBackgroundDrawerDark;
  Color cardItemColor = color.cardItemColorDark;
  Color floatButtonColor =color.floatButtonColorDark;
  Color textItemColor =color.textItemColorDark;



  void increment(Products item) {
    product.add(item);
    counter++;
    Total += item.price;
    emit(IncrementItem());
  }

  void decrement(Products item) {
    product.remove(item);
    counter--;
    Total -=item.price;
    emit(decrementItem());
  }

  void changeColor(bool val){
    if(val==false){
      themeColor = "LightMode";
      mainColor = color.lightColor;
      appbarColor = color.appbarColorLight;
      textCardColor =color.textCardColorLight;
      drawerColor =color.drawerColorLight;
      iconBackgroundDrawer =color.iconBackgroundDrawerLight;
      cardItemColor = color.cardItemColorLight;
      floatButtonColor =color.floatButtonColorLight;
      textItemColor =color.textItemColorLight;
    }else {
      themeColor = "DarkMode";
      mainColor= color.darkColor;
      appbarColor =color.appbarColorDark;
      textCardColor =color.textCardColorDark;
      drawerColor =color.drawerColorDark;
      iconBackgroundDrawer =color.iconBackgroundDrawerDark;
      cardItemColor = color.cardItemColorDark;
      floatButtonColor =color.floatButtonColorDark;
      textItemColor =color.textItemColorDark;
    }
    emit(ChangeColor());
  }

}
