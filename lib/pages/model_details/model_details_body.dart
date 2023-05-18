import 'package:flutter/material.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/domain/entities/option_entity.dart';

class ModelDetailsBody extends StatelessWidget {
  const ModelDetailsBody({Key? key, required this.model, required this.modelOption})
      : super(key: key);
  final Model model;
  final ModelOption modelOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [const Text("Model Ad"), const Spacer(), Text(model.name ?? '')],
          ),
          Row(
            children: [
              const Text("Yaddaş"),
              const Spacer(),
              Text(("${modelOption.storage ?? ''} gb"))
            ],
          ),
          Row(
            children: [
              const Text("Alış Qiyməti"),
              const Spacer(),
              Text(("${modelOption.price?.buyingPrice ?? ''} manat"))
            ],
          ),
          Row(
            children: [
              const Text("Satiş Qiyməti"),
              const Spacer(),
              Text(("${modelOption.price?.sellingPrice ?? ''} manat"))
            ],
          )
        ],
      ),
    );
  }
}
