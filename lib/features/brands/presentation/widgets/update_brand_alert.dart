import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/brands/data/models/brand.dart';
import 'package:telefonchu/features/brands/presentation/blocs/load_brands/brands_cubit.dart';
import 'package:telefonchu/features/brands/presentation/blocs/update_brand/update_brand_cubit.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/shared/widgets/text_field.dart';

class UpdateBrandAlert extends StatefulWidget {
  const UpdateBrandAlert({Key? key, required this.brand}):super(key: key);
  final BrandModel brand;
  show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => UpdateBrandAlert(brand: brand),
    );
  }

  @override
  State<UpdateBrandAlert> createState() => _UpdateBrandAlertState();
}

class _UpdateBrandAlertState extends State<UpdateBrandAlert> {
  String? name;
  @override
  void initState() {
    name = widget.brand.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateBrandCubit(di()),
      child: BlocConsumer<UpdateBrandCubit, UpdateBrandState>(
        listener: (context, state) async {
          if (state is UpdateBrandSuccess) {
            context.read<BrandsCubit>().getBrands();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Brand Edit!'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomTextField(
                initString: name,
                onChanged: (value) {
                  name = value;
                },
              )
            ]),
            actions: (state is UpdateBrandLoading)
                ? const [CircularProgressIndicator()]
                : [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(), child: const Text('imtina')),
                    ElevatedButton(
                        onPressed: () async {
                          context
                              .read<UpdateBrandCubit>()
                              .updateBrand(widget.brand.copyWith(name: name));
                        },
                        child: const Text('Editle'))
                  ],
          );
        },
      ),
    );
  }
}
