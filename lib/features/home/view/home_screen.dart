import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/fish_model.dart';
import '../../../data/repositories/fish_repository.dart';
import '../../../core/network/base_mock_client.dart';
import '../bloc/fish_list_bloc.dart';
import '../bloc/fish_list_event.dart';
import '../bloc/fish_list_state.dart';
import '../../fish_detail/view/fish_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FishListBloc(
        fishRepository: FishRepository(AssetMockClient()),
      )..add(FetchFishes()),
      child: Scaffold(
        appBar: AppBar(title: const Text('ZenSoul Aqua')),
        body: BlocBuilder<FishListBloc, FishListState>(
          builder: (context, state) {
            if (state is FishListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FishListLoaded) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  itemCount: state.fishes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final Fish fish = state.fishes[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FishDetailScreen(fish: fish),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  fish.image,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                fish.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${fish.price} VND',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is FishListError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }

            return const SizedBox(); // fallback
          },
        ),
      ),
    );
  }
}
