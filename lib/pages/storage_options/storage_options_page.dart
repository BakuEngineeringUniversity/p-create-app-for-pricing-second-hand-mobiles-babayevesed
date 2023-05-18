import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/app/app.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/presentation/blocs/model/model_cubit.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/pages/storage_options/storage_option_body.dart';
import 'package:telefonchu/pages/storage_options/storage_options_app_bar.dart';

class StorageOptionsPage extends StatelessWidget {
  const StorageOptionsPage({super.key, required this.model});
  static const String routeName = '/storage_options';
  final Model model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModelCubit(
        di(),
      ),
      child: BlocConsumer<ModelCubit, ModelState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ModelInitial) {
            context.read<ModelCubit>().getModel(model.docId!);
          }

          return Scaffold(
            appBar: (state is ModelSuccess)
                ? ModelOptionsAppBar(
                    model: state.model,
                    onOptionAdded: () {
                      context.read<ModelCubit>().getModel(state.model.docId!);
                    },
                    isAdmin: App.isAdmin,
                  )
                : null,
            body: (state is ModelInProgress)
                ? const CircularProgressIndicator.adaptive()
                : (state is ModelSuccess)
                    ? ModelOptionBody(
                        model: state.model,
                        selectedOptions: const [],
                      )
                    : const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
