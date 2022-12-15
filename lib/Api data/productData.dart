import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/products model.dart';

class FetchData {
  static Future<List<Products>?> ProductData(String productName) async {
    http.Response response =
    await http.get(Uri.parse("https://dummyjson.com/products/category/$productName"));
    if(response.statusCode ==200){
      dynamic body = jsonDecode(response.body); // store data and variable
      List<Products>dataphone =[];
      for(int i =0;i<body['products'].length;i++){
        dataphone.add(Products.fromjson(body,i));
      }
      return dataphone;
    }
      return null;
  }
}