import '../models/cart_item_model.dart';

abstract class CartEvent {}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final CartItem item;
  AddToCart(this.item);
}

class RemoveFromCart extends CartEvent {
  final String itemId;
  RemoveFromCart(this.itemId);
}

class UpdateCartItemQuantity extends CartEvent {
  final String itemId;
  final int quantity;
  UpdateCartItemQuantity({required this.itemId, required this.quantity});
}
