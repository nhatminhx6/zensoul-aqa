import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/fish_model.dart';
import '../bloc/fish_detail_bloc.dart';
import '../bloc/fish_detail_event.dart';
import '../bloc/fish_detail_state.dart';

class FishDetailScreen extends StatelessWidget {
  final Fish fish;

  const FishDetailScreen({super.key, required this.fish});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FishDetailBloc()..add(LoadFishDetail(fish)),
      child: Scaffold(
        appBar: AppBar(title: Text(fish.name)),
        body: BlocBuilder<FishDetailBloc, FishDetailState>(
          builder: (context, state) {
            if (state is FishDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FishDetailLoaded) {
              final f = state.fish;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        f.image,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      f.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${f.price} VND',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    const Text('Mô tả', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Loài cá cảnh sống khoẻ, dễ nuôi, phù hợp hồ planted.'), // mô tả tạm
                    const SizedBox(height: 16),
                    const Text('Thông tin khác', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Nguồn gốc: Thái Lan'),     // hardcoded tạm
                    Text('Kích thước: 5-6cm'),
                    Text('Loại nước: Nước ngọt'),
                  ],
                ),
              );
            } else if (state is FishDetailError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }

            return const SizedBox(); // fallback
          },
        ),
      ),
    );
  }
}
