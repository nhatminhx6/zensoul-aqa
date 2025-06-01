import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/category_model.dart';

class CategoryRepository {
  Future<List<Category>> fetchCategories() async {
    await Future.delayed(const Duration(milliseconds: 500)); // giả delay gọi API
    final jsonStr = await rootBundle.loadString('assets/mock-data/categories.json');
    final List<dynamic> jsonList = jsonDecode(jsonStr);
    return jsonList.map((e) => Category.fromJson(e)).toList();
  }
}
