import 'package:flutter/material.dart';
import 'package:telefonchu/pages/login/login_page_app_bar.dart';

import 'login_page_body.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LoginpageAppBar(),
      body: LoginPageBody(),
    );
  }
}
