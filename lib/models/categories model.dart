class Categories {
 final String nameCatigories ;
 const Categories({required this.nameCatigories});
  factory Categories.fromjson(String json){
    return Categories(
      nameCatigories: json
    );
  }
}