import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'bloc/cart_event.dart';
import 'bloc/cart_state.dart';
import 'data/cart_repository.dart';
import '../cart/models/cart_item_model.dart';
import '../../../common/widgets/zensoul_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(CartRepository())..add(LoadCart()),
      child: Scaffold(
        appBar: const ZensoulAppBar(title: 'Giỏ hàng'),
        body: SafeArea(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CartLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.items.length,
                        separatorBuilder: (_, __) =>
                        const Divider(height: 1, thickness: 0.5),
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  item.imageUrl,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.broken_image, size: 48),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(item.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 4),
                                      Text('Số lượng: ${item.quantity}',
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('${item.price.toStringAsFixed(0)}đ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500)),
                                    IconButton(
                                      icon: const Icon(
                                          Icons.delete_outline_rounded),
                                      onPressed: () => context
                                          .read<CartBloc>()
                                          .add(RemoveFromCart(item.id)),
                                      iconSize: 20,
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tổng cộng:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('${state.total.toStringAsFixed(0)}đ',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Center(child: Text('Không thể tải giỏ hàng'));
              }
            },
          ),
        ),
      ),
    );
  }
}
