import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:telefonchu/app/app.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/presentation/blocs/model/model_cubit.dart';
import 'package:telefonchu/features/models/presentation/blocs/update_model/update_model_cubit.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/pages/model_details/model_details_page.dart';
import '../../features/models/presentation/widgets/update_model_option_alert.dart';

class ModelOptionBody extends StatelessWidget {
  const ModelOptionBody({
    super.key,
    required this.model,
    required this.selectedOptions,
  });
  final Model model;

  final List<int> selectedOptions;

  @override
  Widget build(BuildContext context) {
    final options = model.modelOptions ?? [];
    return BlocProvider(
      create: (context) => UpdateModelCubit(di()),
      child: BlocConsumer<UpdateModelCubit, UpdateModelState>(
        listener: (context, state) {
          if (state is UpdateModelSuccess) {
            context.read<ModelCubit>().getModel(model.docId!);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: options.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final option = options[index];
                return Slidable(
                  enabled: App.isAdmin,
                  key: ValueKey(index),
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),
                    extentRatio: 0.2,
                    dragDismissible: false,
                    dismissible: DismissiblePane(onDismissed: () {}),

                    children: [
                      SlidableAction(
                        onPressed: (ctx) {
                          context.read<UpdateModelCubit>().updateModel(model
                            ..modelOptions!.removeWhere((element) => element.id == option.id));
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),
                    extentRatio: 0.2,
                    dragDismissible: false,
                    dismissible: DismissiblePane(onDismissed: () {}),

                    children: [
                      SlidableAction(
                        onPressed: (ctx) {
                          UpdateModelOptionAlert(
                            model: model,
                            option: option,
                            onSuccess: () {
                              context.read<ModelCubit>().getModel(model.docId!);
                            },
                          ).show(context);
                          // context.read<UpdateModelCubit>().updateModel(model);
                        },
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Edit',
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ModelDetailsPage.routeName,
                          arguments: {"model": model, "model_option": option});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue, borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          Text(
                            '${option.storage} gb',
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                "Alış qiyməti: ${option.price!.buyingPrice}",
                                style: const TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Satış qiyməti: ${option.price!.sellingPrice}",
                                style: const TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
