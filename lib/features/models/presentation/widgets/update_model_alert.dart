import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/shared/widgets/text_field.dart';
import '../blocs/update_model/update_model_cubit.dart';

class UpdateModelAlert extends StatefulWidget {
  const UpdateModelAlert({Key? key, required this.model, required this.onSuccess})
      : super(key: key);

  final Model model;
  final Function() onSuccess;

  Future<void> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => UpdateModelAlert(
        model: model,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  State<UpdateModelAlert> createState() => _UpdateModelAlertState();
}

class _UpdateModelAlertState extends State<UpdateModelAlert> {
  String? name;
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
                initString: widget.model.name,
                onChanged: (value) {
                  name = value;
                },
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
                              name: name,
                              modelOptions: widget.model.modelOptions,
                              docId: widget.model.docId,
                              brandID: widget.model.brandID,
                              id: widget.model.docId));
                        },
                        child: const Text('Update'))
                  ],
          );
        },
      ),
    );
  }
}
