import 'package:flutter/material.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/shared/widgets/app_bar.dart';

import '../../features/models/presentation/widgets/add_model_option.dart';

class ModelOptionsAppBar extends CustomAppBar {
  const ModelOptionsAppBar(
      {super.key, required this.model, required this.onOptionAdded, required this.isAdmin});
  final Function() onOptionAdded;
  final Model model;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Storage Options',
      actions: isAdmin
          ? [
              IconButton(
                  onPressed: () {
                    AddModelOptionAlert(
                      model: model,
                      onSuccess: () {
                        onOptionAdded.call();
                      },
                    ).show(context);
                  },
                  icon: const Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.black,
                  ))
            ]
          : null,
    );
  }
}
