import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/app/app.dart';
import 'package:telefonchu/features/models/presentation/blocs/loads_models/models_cubit.dart';
import 'package:telefonchu/features/models/presentation/widgets/delete_model_alert.dart';
import 'package:telefonchu/features/models/presentation/widgets/update_model_alert.dart';
import 'package:telefonchu/pages/storage_options/storage_options_page.dart';
import 'package:telefonchu/shared/helpers/custom_snackbar.dart';
import 'package:telefonchu/shared/widgets/category_widget.dart';

class ModelsGridView extends StatelessWidget {
  const ModelsGridView({Key? key, required this.brandID}) : super(key: key);
  final String brandID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModelsCubit, ModelsState>(
      listener: (context, state) {
        if (state is ModelsFailure) {
          showCustomSnackBar(context, message: state.failure.errorMessage ?? '');
        }
      },
      builder: (context, state) {
        if (state is! ModelsSuccess) {
          return const SizedBox();
        }
        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final model = state.models[index];
            return CategoryWidget(
              name: model.name ?? 'Adsiz',
              isAdmin: App.isAdmin,
              onTap: () {
                Navigator.of(context)
                    .pushNamed(StorageOptionsPage.routeName, arguments: {'model': model});
              },
              onEdit: () {
                UpdateModelAlert(
                  model: model,
                  onSuccess: () => context.read<ModelsCubit>().getModels(brandID),
                ).show(context);
              },
              onRemove: () {
                DeleteModelAlert(
                    modelDocID: model.docId!,
                    onSuccess: () => context.read<ModelsCubit>().getModels(brandID)).show(context);
              },
            );
          },
          itemCount: state.models.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: (MediaQuery.of(context).size.width / 3),
              mainAxisSpacing: 15,
              crossAxisSpacing: 20),
        );
      },
    );
  }
}
