import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../models/category_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<LoadCategories>(_onLoadCategories);
  }

  void _onLoadCategories(LoadCategories event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    final categories = [
      Category(
        id: 'fish',
        name: 'Cá cảnh',
        imageUrl: 'https://thucancakoihikari.com/wp-content/uploads/2024/06/ca-canh-dep-nhat-viet-nam-1.jpg',
      ),
      Category(
        id: 'plants',
        name: 'Cây thuỷ sinh',
        imageUrl: 'https://file.hstatic.net/1000100178/file/image001_0e26573450f1486cbbe3bcf6642bfbb5_grande.jpg',
      ),
      Category(
        id: 'equipment',
        name: 'Thiết bị',
        imageUrl: 'https://thietbicakoi.com/wp-content/uploads/2024/08/z5370994471205_0d93e7c81c5ddf8a339deec0946a9b27-533x400.jpg',
      ),
    ];


    emit(HomeLoaded(categories));
  }
}
