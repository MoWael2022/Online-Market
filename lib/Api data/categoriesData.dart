import 'dart:convert';
import 'package:hr_task/models/categories%20model.dart';
import 'package:http/http.dart' as http;


class FetchCategoriesData {
   static Future<List<Categories>> Categoriesdata() async {
    http.Response response =
        await http.get(Uri.parse("https://dummyjson.com/products/categories"));
    if(response.statusCode ==200){
      dynamic body = jsonDecode(response.body); // store data and variable
      List<Categories>data =[];
      for(var i in body){
        data.add(Categories.fromjson(i));
      }
      return data;
    }else{
      throw Exception('THE ERROR IS HERE');
    }
  }
}
