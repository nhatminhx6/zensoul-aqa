import '../models/category_model.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Category> categories;
  HomeLoaded(this.categories);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
