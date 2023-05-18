import 'package:flutter/material.dart';
import 'package:telefonchu/shared/widgets/app_bar.dart';

class LoginpageAppBar extends CustomAppBar {
  const LoginpageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      title: 'Login Page',
      implementBackButton: false,
    );
  }
}
