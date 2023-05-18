import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/app/app.dart';
import 'package:telefonchu/app/route.dart';
import 'package:telefonchu/features/brands/presentation/blocs/load_brands/brands_cubit.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/pages/home_page/home_page.dart';
import 'package:telefonchu/pages/login/login_page.dart';

import '../features/models/presentation/blocs/loads_models/models_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BrandsCubit(di()),
        ),
        BlocProvider(
          create: (context) => ModelsCubit(di()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: App.isSignedIn ? HomePage.routeName : LoginPage.routeName,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
