import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/brands/presentation/blocs/delete_brand/delete_brand_cubit.dart';
import 'package:telefonchu/features/brands/presentation/blocs/load_brands/brands_cubit.dart';
import 'package:telefonchu/injection_container.dart';

class DeleteBrandAlert extends StatelessWidget {
  const DeleteBrandAlert({Key? key, required this.brandDocID}):super(key: key);
  final String brandDocID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteBrandCubit(di()),
      child: BlocConsumer<DeleteBrandCubit, DeleteBrandState>(
        listener: (context, state) async {
          if (state is DeleteBrandSuccess) {
            context.read<BrandsCubit>().getBrands();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Brand-i Sil'),
            actions: (state is DeleteBrandLoading)
                ? const [CircularProgressIndicator()]
                : [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(), child: const Text('imtina')),
                    ElevatedButton(
                        onPressed: () async {
                          context.read<DeleteBrandCubit>().deleteBrand(brandDocID);
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
      builder: (context) => DeleteBrandAlert(brandDocID: brandDocID),
    );
  }
}
