import 'package:flutter/material.dart';
import 'package:hr_task/cubit/app_cubit.dart';
import 'package:hr_task/cubit/app_state.dart';
import 'package:hr_task/pages/categoryPage.dart';
import 'package:sizer/sizer.dart';
import '../Api data/categoriesData.dart';
import '../models/categories model.dart';
import 'cards.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchData extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(

        icon: Icon(Icons.close),
        onPressed: () {
          query="";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }




  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
      builder : (context,state){
        return Container(
          color: BlocProvider.of<AppCubit>(context).mainColor,
          child: FutureBuilder(
              future: FetchCategoriesData.Categoriesdata(),
              builder: (context, snapshot) {
                List<Categories>? categories = snapshot.data;
                if (snapshot.hasData) {
                  List<Categories> filterproduct = snapshot.data!
                      .where((element) => element.nameCatigories.startsWith(query))
                      .toList();
                  return Padding(
                    padding: EdgeInsets.fromLTRB(2.h, 3.h, 2.h, 0),
                    child: ListView.builder(
                        itemCount:
                        query == "" ? categories!.length : filterproduct.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Center(
                                child: query == ''
                                    ? Cards(
                                  page_name: categories![i].nameCatigories,
                                )
                                    : Cards(
                                  page_name: filterproduct[i].nameCatigories,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              )
                            ],
                          );
                        }),
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
                              return Home();
                            })) ;
                          }, child: const Text("Retry")),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        );
    }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
