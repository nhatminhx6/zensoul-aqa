import 'package:equatable/equatable.dart';
import '../../../../data/models/fish_model.dart';

abstract class FishDetailState extends Equatable {
  const FishDetailState();

  @override
  List<Object?> get props => [];
}

class FishDetailInitial extends FishDetailState {}

class FishDetailLoading extends FishDetailState {}

class FishDetailLoaded extends FishDetailState {
  final Fish fish;

  const FishDetailLoaded(this.fish);

  @override
  List<Object?> get props => [fish];
}

class FishDetailError extends FishDetailState {
  final String message;

  const FishDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
