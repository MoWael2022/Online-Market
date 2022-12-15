import 'package:hr_task/models/categories%20model.dart';

abstract class AppState {}

class AppInitial extends AppState{}

class IncrementItem extends AppState{
  // List<Categories>? categories;
  // SuccessState({this.categories});
}
class decrementItem extends AppState{}

class ChangeColor extends AppState{}



