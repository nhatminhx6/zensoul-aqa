import '../../core/network/base_mock_client.dart';
import '../models/fish_model.dart';

/// Repository layer to fetch fish data from mock API
class FishRepository {
  final BaseMockClient client;

  FishRepository(this.client);

  Future<List<Fish>> fetchFishes() async {
    final data = await client.getJsonList('assets/fishes.json');
    return data.map((item) => Fish.fromJson(item)).toList();
  }
}
