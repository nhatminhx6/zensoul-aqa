import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/cart_item_model.dart';

class CartRepository {
  Future<List<CartItem>> fetchCartItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final jsonStr = await rootBundle.loadString('assets/mock-data/cart_items.json');
    final List<dynamic> jsonList = jsonDecode(jsonStr);
    return jsonList.map((e) => CartItem.fromJson(e)).toList();
  }
}
