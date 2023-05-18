import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/app/app.dart';
import 'package:telefonchu/features/brands/presentation/blocs/load_brands/brands_cubit.dart';
import 'package:telefonchu/features/brands/presentation/widgets/delete_brand_alert.dart';
import 'package:telefonchu/features/brands/presentation/widgets/update_brand_alert.dart';
import 'package:telefonchu/pages/models_page/models_page.dart';
import 'package:telefonchu/shared/helpers/custom_snackbar.dart';
import 'package:telefonchu/shared/widgets/category_widget.dart';

class BrandsGridView extends StatelessWidget {
  const BrandsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandsCubit, BrandsState>(
      listener: (context, state) {
        if (state is BrandsFailure) {
          showCustomSnackBar(context, message: state.failure.errorMessage ?? '');
        }
      },
      builder: (context, state) {
        if (state is BrandsInitial) {
          context.read<BrandsCubit>().getBrands();
        }
        if (state is! BrandsSuccess) {
          return const SizedBox();
        }
        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final brand = state.brands[index];
            return CategoryWidget(
              name: brand.name ?? 'Adsiz',
              isAdmin: App.isAdmin,
              onTap: () => Navigator.of(context)
                  .pushNamed(ModelsPage.routeName, arguments: {"brand_id": brand.id}),
              onEdit: () {
                UpdateBrandAlert(brand: brand).show(context);
              },
              onRemove: () {
                DeleteBrandAlert(brandDocID: brand.docId!).show(context);
              },
            );
          },
          itemCount: state.brands.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: (MediaQuery.of(context).size.width / 2.5),
              mainAxisSpacing: 15,
              crossAxisSpacing: 20),
        );
      },
    );
  }
}
