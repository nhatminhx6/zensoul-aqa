import 'package:equatable/equatable.dart';
import '../../../../data/models/fish_model.dart';

abstract class FishDetailEvent extends Equatable {
  const FishDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadFishDetail extends FishDetailEvent {
  final Fish fish;

  const LoadFishDetail(this.fish);

  @override
  List<Object?> get props => [fish];
}
