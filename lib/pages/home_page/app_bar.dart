import 'package:flutter/material.dart';
import 'package:telefonchu/features/login/presentation/widgets/log_out_confirmation_alert.dart';
import 'package:telefonchu/shared/widgets/app_bar.dart';

class HomePageAppbar extends CustomAppBar {
  const HomePageAppbar({super.key, required this.onAdd, required this.isAdmin});
  final Function() onAdd;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Brands',
      leading: IconButton(
        icon: const Icon(
          Icons.logout,
          color: Colors.black,
        ),
        onPressed: () {
          const LogOutConfirmationAlert().show(context);
        },
      ),
      actions: [
        if (isAdmin)
          IconButton(
            padding: const EdgeInsets.all(8),
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.black,
            ),
            onPressed: onAdd,
          )
      ],
    );
  }
}
