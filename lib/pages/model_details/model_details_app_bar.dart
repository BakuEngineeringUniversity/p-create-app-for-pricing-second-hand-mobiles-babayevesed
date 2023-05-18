import 'package:flutter/material.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/shared/widgets/app_bar.dart';

class ModelDetailsAppBar extends CustomAppBar {
  const ModelDetailsAppBar({super.key, required this.model});
  final Model model;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: model.name,
    );
  }
}
