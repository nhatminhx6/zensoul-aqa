import 'package:flutter_bloc/flutter_bloc.dart';
import 'fish_list_event.dart';
import 'fish_list_state.dart';
import '../../../../data/repositories/fish_repository.dart';

class FishListBloc extends Bloc<FishListEvent, FishListState> {
  final FishRepository fishRepository;

  FishListBloc({required this.fishRepository}) : super(FishListInitial()) {
    on<FetchFishes>(_onFetchFishes);
  }

  Future<void> _onFetchFishes(
      FetchFishes event,
      Emitter<FishListState> emit,
      ) async {
    emit(FishListLoading());
    try {
      final fishes = await fishRepository.fetchFishes();
      emit(FishListLoaded(fishes));
    } catch (e) {
      emit(FishListError(e.toString()));
    }
  }
}
