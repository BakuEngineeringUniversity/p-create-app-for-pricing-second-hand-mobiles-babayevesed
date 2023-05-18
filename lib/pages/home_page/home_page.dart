import 'package:flutter/material.dart';
import 'package:telefonchu/app/app.dart';
import 'package:telefonchu/features/brands/presentation/widgets/add_brand_alert.dart';
import 'package:telefonchu/pages/home_page/app_bar.dart';
import 'package:telefonchu/features/brands/presentation/widgets/brands_gridview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppbar(
        onAdd: () {
          const AddBrandAlert().show(context);
        },
        isAdmin: App.isAdmin,
      ),
      body: const BrandsGridView(),
    );
  }
}
