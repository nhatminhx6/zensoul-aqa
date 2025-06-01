import 'package:equatable/equatable.dart';

abstract class FishListEvent extends Equatable {
  const FishListEvent();

  @override
  List<Object?> get props => [];
}

class FetchFishes extends FishListEvent {}
