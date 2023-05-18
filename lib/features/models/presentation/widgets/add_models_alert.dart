import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/presentation/blocs/add_model/add_model_cubit.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/shared/widgets/text_field.dart';

class AddModelAlert extends StatefulWidget {
  const AddModelAlert({Key? key, required this.brandID, required this.onSuccess}) : super(key: key);
  final String brandID;
  final Function() onSuccess;

  Future<void> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AddModelAlert(
        brandID: brandID,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  State<AddModelAlert> createState() => _AddModelAlertState();
}

class _AddModelAlertState extends State<AddModelAlert> {
  String? name;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddModelCubit(di()),
      child: BlocConsumer<AddModelCubit, AddModelState>(
        listener: (context, state) async {
          if (state is AddModelSuccess) {
            Navigator.of(context).pop();
            widget.onSuccess.call();
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Model Add!'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomTextField(
                initString: name,
                onChanged: (value) {
                  name = value;
                },
              )
            ]),
            actions: (state is AddModelInProgress)
                ? const [CircularProgressIndicator()]
                : [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(), child: const Text('imtina')),
                    ElevatedButton(
                        onPressed: () async {
                          context.read<AddModelCubit>().addModel(Model(
                              name: name,
                              brandID: widget.brandID,
                              id: Random().nextInt(9999).toString()));
                        },
                        child: const Text('Add'))
                  ],
          );
        },
      ),
    );
  }
}
