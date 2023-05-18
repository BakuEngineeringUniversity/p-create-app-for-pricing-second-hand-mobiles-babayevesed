import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/domain/entities/option_entity.dart';
import 'package:telefonchu/features/models/domain/entities/price_entity.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/shared/widgets/text_field.dart';
import '../blocs/update_model/update_model_cubit.dart';

class UpdateModelOptionAlert extends StatefulWidget {
  const UpdateModelOptionAlert(
      {Key? key, required this.model, required this.option, required this.onSuccess})
      : super(key: key);
  final Model model;
  final ModelOption option;
  final Function() onSuccess;

  Future<void> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => UpdateModelOptionAlert(
        model: model,
        option: option,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  State<UpdateModelOptionAlert> createState() => _UpdateModelOptionAlertState();
}

class _UpdateModelOptionAlertState extends State<UpdateModelOptionAlert> {
  int? storage;
  double? buyingPrice;
  double? sellingPrice;
  @override
  void initState() {
    super.initState();
    storage = widget.option.storage;
    buyingPrice = widget.option.price?.buyingPrice;
    sellingPrice = widget.option.price?.sellingPrice;
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
                initString: storage?.toString(),
                keyBoardType: TextInputType.number,
                onChanged: (value) {
                  storage = int.parse(value);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: 'Alis Qiymet',
                      initString: buyingPrice?.toString(),
                      keyBoardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty) buyingPrice = double.parse(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                      title: 'Satis Qiymet',
                      initString: sellingPrice?.toString(),
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
                                    ...widget.model.modelOptions!.where(
                                      (option) => option.id != widget.option.id,
                                    ),
                                    ModelOption(
                                        id: widget.option.id,
                                        storage: storage,
                                        price: Price(
                                          buyingPrice: buyingPrice,
                                          sellingPrice: sellingPrice,
                                        ))
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
