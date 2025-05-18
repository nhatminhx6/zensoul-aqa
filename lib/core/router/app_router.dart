import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/fish_model.dart';
import '../../../features/home/view/home_screen.dart';
import '../../../features/fish_detail/view/fish_detail_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/fish-detail',
      name: 'fishDetail',
      builder: (context, state) {
        final fish = state.extra as Fish;
        return FishDetailScreen(fish: fish);
      },
    ),
  ],
);
