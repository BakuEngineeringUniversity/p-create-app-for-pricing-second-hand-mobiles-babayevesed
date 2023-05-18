import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/brands/data/models/brand.dart';
import 'package:telefonchu/features/brands/presentation/blocs/load_brands/brands_cubit.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/shared/widgets/text_field.dart';

import '../blocs/add_brand/add_brand_cubit.dart';

class AddBrandAlert extends StatefulWidget {
  const AddBrandAlert({Key? key}):super(key: key);

  show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddBrandAlert(),
    );
  }

  @override
  State<AddBrandAlert> createState() => _AddBrandAlertState();
}

class _AddBrandAlertState extends State<AddBrandAlert> {
  String? name;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBrandCubit(di()),
      child: BlocConsumer<AddBrandCubit, AddBrandState>(
        listener: (context, state) async {
          if (state is AddBrandSuccess) {
            context.read<BrandsCubit>().getBrands();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Brand Add!'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomTextField(
                initString: name,
                onChanged: (value) {
                  name = value;
                },
              )
            ]),
            actions: (state is AddBrandLoading)
                ? const [CircularProgressIndicator()]
                : [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(), child: const Text('imtina')),
                    ElevatedButton(
                        onPressed: () async {
                          context.read<AddBrandCubit>().addBrand(
                              BrandModel(name: name, id: Random().nextInt(100).toString()));
                        },
                        child: const Text('Add'))
                  ],
          );
        },
      ),
    );
  }
}
