import 'package:flutter/material.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/pages/login/login_page.dart';
import 'package:telefonchu/pages/model_details/model_details_page.dart';
import 'package:telefonchu/pages/models_page/models_page.dart';
import 'package:telefonchu/pages/storage_options/storage_options_page.dart';

import '../pages/home_page/home_page.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings? settings) {
    final args = settings?.arguments;

    switch (settings?.name) {
       case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => const LoginPage(), settings: settings);
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage(), settings: settings);
      case ModelsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => ModelsPage(brandID: (args as Map)["brand_id"] as String),
            settings: settings);
      case StorageOptionsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => StorageOptionsPage(model: (args as Map)["model"] as Model),
            settings: settings);
      case ModelDetailsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => ModelDetailsPage(
                  model: (args as Map)["model"] as Model,
                  modelOption: args["model_option"],
                ),
            settings: settings);
      default:
        MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("No Page"),
                  ),
                ),
            settings: settings);
    }
  }
}
