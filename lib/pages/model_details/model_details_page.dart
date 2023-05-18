import 'package:flutter/material.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/domain/entities/option_entity.dart';
import 'package:telefonchu/pages/model_details/model_details_app_bar.dart';
import 'package:telefonchu/pages/model_details/model_details_body.dart';

class ModelDetailsPage extends StatefulWidget {
  static const String routeName = '/model_details';
  const ModelDetailsPage({super.key, required this.model, required this.modelOption});
  final Model model;
  final ModelOption modelOption;

  @override
  State<ModelDetailsPage> createState() => _ModelDetailsPageState();
}

class _ModelDetailsPageState extends State<ModelDetailsPage> {
  late Model model;
  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModelDetailsAppBar(model: model),
      body: ModelDetailsBody(
        model: model,
        modelOption: widget.modelOption,
      ),
    );
  }
}
