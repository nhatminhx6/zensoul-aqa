import '../models/cart_item_model.dart';

abstract class CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  final double total;

  CartLoaded({required this.items})
      : total = items.fold(0, (sum, item) => sum + item.price * item.quantity);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}
