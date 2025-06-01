import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app_bloc/core/utils/router/routes.dart';

class ZensoulAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;

  const ZensoulAppBar({
    super.key,
    required this.title,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBack,
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            context.pushNamed(Routes.cart.name);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
