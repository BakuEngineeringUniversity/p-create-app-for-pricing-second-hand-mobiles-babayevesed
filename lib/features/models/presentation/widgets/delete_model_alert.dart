import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/injection_container.dart';
import '../blocs/delete_model/delete_model_cubit.dart';

class DeleteModelAlert extends StatelessWidget {
  const DeleteModelAlert({Key?key, required this.modelDocID, required this.onSuccess}):super(key: key);
  final String modelDocID;
  final Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteModelCubit(di()),
      child: BlocConsumer<DeleteModelCubit, DeleteModelState>(
        listener: (context, state) async {
          if (state is DeleteModelSuccess) {
            Navigator.of(context).pop();
            onSuccess.call();
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Model-i Sil'),
            actions: (state is DeleteModelInProgress)
                ? const [CircularProgressIndicator()]
                : [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(), child: const Text('imtina')),
                    ElevatedButton(
                        onPressed: () async {
                          context.read<DeleteModelCubit>().deleteModel(modelDocID);
                        },
                        child: const Text('Sil'))
                  ],
          );
        },
      ),
    );
  }

  show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DeleteModelAlert(
        modelDocID: modelDocID,
        onSuccess: onSuccess,
      ),
    );
  }
}
