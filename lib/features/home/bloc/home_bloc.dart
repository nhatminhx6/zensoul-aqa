import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../models/category_model.dart';
import '../data/category_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository categoryRepository;

  HomeBloc(this.categoryRepository) : super(HomeLoading()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(LoadCategories event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final categories = await categoryRepository.fetchCategories();
      emit(HomeLoaded(categories));
    } catch (e) {
      emit(HomeError('Failed to load categories'));
    }
  }
}
