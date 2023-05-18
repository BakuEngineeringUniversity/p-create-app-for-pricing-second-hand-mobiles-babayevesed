import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/models/presentation/blocs/loads_models/models_cubit.dart';
import 'package:telefonchu/features/models/presentation/widgets/models_grid_view.dart';
import 'package:telefonchu/pages/models_page/app_bar.dart';

import '../../app/app.dart';
import '../../features/models/presentation/widgets/add_models_alert.dart';

class ModelsPage extends StatefulWidget {
  const ModelsPage({super.key, required this.brandID});
  final String brandID;
  static const String routeName = '/models';

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ModelsCubit>().getModels(widget.brandID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModelsPageAppBar(
          isAdmin: App.isAdmin,
          onAdd: () {
            AddModelAlert(
              brandID: widget.brandID,
              onSuccess: () {
                context.read<ModelsCubit>().getModels(widget.brandID);
              },
            ).show(context);
          }),
      body: ModelsGridView(brandID: widget.brandID),
    );
  }
}
