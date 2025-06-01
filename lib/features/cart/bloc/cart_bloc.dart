import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../models/cart_item_model.dart';
import '../data/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartLoading()) {
    on<LoadCart>(_onLoad);
    on<AddToCart>(_onAdd);
    on<RemoveFromCart>(_onRemove);
    on<UpdateCartItemQuantity>(_onUpdateQuantity);
  }

  Future<void> _onLoad(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await cartRepository.fetchCartItems();
      emit(CartLoaded(items: items));
    } catch (e) {
      emit(CartError('Failed to load cart'));
    }
  }

  void _onAdd(AddToCart event, Emitter<CartState> emit) {
    if (state is! CartLoaded) return;
    final current = (state as CartLoaded).items;
    final updated = List<CartItem>.from(current);
    final index = updated.indexWhere((item) => item.id == event.item.id);
    if (index >= 0) {
      final existing = updated[index];
      updated[index] = existing.copyWith(quantity: existing.quantity + event.item.quantity);
    } else {
      updated.add(event.item);
    }
    emit(CartLoaded(items: updated));
  }

  void _onRemove(RemoveFromCart event, Emitter<CartState> emit) {
    if (state is! CartLoaded) return;
    final current = (state as CartLoaded).items;
    final updated = current.where((item) => item.id != event.itemId).toList();
    emit(CartLoaded(items: updated));
  }

  void _onUpdateQuantity(UpdateCartItemQuantity event, Emitter<CartState> emit) {
    if (state is! CartLoaded) return;
    final updated = (state as CartLoaded).items.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(quantity: event.quantity);
      }
      return item;
    }).toList();
    emit(CartLoaded(items: updated));
  }
}
