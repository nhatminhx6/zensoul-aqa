import 'dart:convert';
import 'package:flutter/services.dart';

/// Base class for mock API client that reads JSON from assets
abstract class BaseMockClient {
  Future<List<dynamic>> getJsonList(String assetPath);
}

/// Concrete mock client that reads local asset files (fishes.json, etc.)
class AssetMockClient implements BaseMockClient {
  @override
  Future<List<dynamic>> getJsonList(String assetPath) async {
    final jsonString = await rootBundle.loadString(assetPath);
    return json.decode(jsonString) as List<dynamic>;
  }
}
