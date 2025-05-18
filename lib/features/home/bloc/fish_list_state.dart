import 'package:equatable/equatable.dart';
import '../../../../data/models/fish_model.dart';

abstract class FishListState extends Equatable {
  const FishListState();

  @override
  List<Object?> get props => [];
}

class FishListInitial extends FishListState {}

class FishListLoading extends FishListState {}

class FishListLoaded extends FishListState {
  final List<Fish> fishes;

  const FishListLoaded(this.fishes);

  @override
  List<Object?> get props => [fishes];
}

class FishListError extends FishListState {
  final String message;

  const FishListError(this.message);

  @override
  List<Object?> get props => [message];
}
