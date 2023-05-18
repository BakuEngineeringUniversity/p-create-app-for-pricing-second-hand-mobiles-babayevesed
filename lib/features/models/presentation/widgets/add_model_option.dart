import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/domain/entities/option_entity.dart';
import 'package:telefonchu/features/models/domain/entities/price_entity.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/shared/widgets/text_field.dart';
import '../blocs/update_model/update_model_cubit.dart';

class AddModelOptionAlert extends StatefulWidget {
  const AddModelOptionAlert({Key? key, required this.model, required this.onSuccess})
      : super(key: key);
  final Model model;

  final Function() onSuccess;

  Future<void> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AddModelOptionAlert(
        model: model,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  State<AddModelOptionAlert> createState() => _AddModelOptionAlertState();
}

class _AddModelOptionAlertState extends State<AddModelOptionAlert> {
  int storage = 32;
  double sellingPrice = 0;
  double buyingPrice = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateModelCubit(di()),
      child: BlocConsumer<UpdateModelCubit, UpdateModelState>(
        listener: (context, state) async {
          if (state is UpdateModelSuccess) {
            Navigator.of(context).pop();
            widget.onSuccess.call();
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Model Update!'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomTextField(
                title: 'Yaddas',
                initString: storage.toString(),
                keyBoardType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) storage = int.parse(value);
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: 'Alis Qiymet',
                      initString: buyingPrice.toString(),
                      keyBoardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty) buyingPrice = double.parse(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: CustomTextField(
                      title: 'Satis Qiymet',
                      initString: sellingPrice.toString(),
                      keyBoardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty) sellingPrice = double.parse(value);
                      },
                    ),
                  )
                ],
              )
            ]),
            actions: (state is UpdateModelInProgress)
                ? const [CircularProgressIndicator()]
                : [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(), child: const Text('imtina')),
                    ElevatedButton(
                        onPressed: () async {
                          context.read<UpdateModelCubit>().updateModel(Model(
                                  name: widget.model.name,
                                  id: widget.model.id,
                                  brandID: widget.model.brandID,
                                  docId: widget.model.docId,
                                  modelOptions: [
                                    ...widget.model.modelOptions ?? [],
                                    ModelOption(
                                        id: Random().nextInt(1000).toString(),
                                        price: Price(
                                          sellingPrice: sellingPrice,
                                          buyingPrice: buyingPrice,
                                        ),
                                        storage: storage)
                                  ]));
                        },
                        child: const Text('Update'))
                  ],
          );
        },
      ),
    );
  }
}
