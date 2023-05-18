import 'package:flutter/material.dart';
import 'package:telefonchu/shared/widgets/app_bar.dart';

class ModelsPageAppBar extends CustomAppBar {
  const ModelsPageAppBar({super.key, required this.isAdmin, required this.onAdd});

  final bool isAdmin;
  final Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Models',
      actions: [
        if (isAdmin)
          IconButton(
            padding: const EdgeInsets.all(8),
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.black,
            ),
            onPressed: onAdd,
          )
      ],
    );
  }
}
