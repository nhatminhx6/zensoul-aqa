import 'package:flutter_bloc/flutter_bloc.dart';
import 'fish_detail_event.dart';
import 'fish_detail_state.dart';

class FishDetailBloc extends Bloc<FishDetailEvent, FishDetailState> {
  FishDetailBloc() : super(FishDetailInitial()) {
    on<LoadFishDetail>(_onLoadFishDetail);
  }

  void _onLoadFishDetail(
      LoadFishDetail event,
      Emitter<FishDetailState> emit,
      ) async {
    emit(FishDetailLoading());

    try {
      // Giả sử ở đây sẽ call API trong tương lai, hiện tại dùng object sẵn
      await Future.delayed(const Duration(milliseconds: 300)); // giả loading
      emit(FishDetailLoaded(event.fish));
    } catch (e) {
      emit(FishDetailError('Failed to load fish detail'));
    }
  }
}
