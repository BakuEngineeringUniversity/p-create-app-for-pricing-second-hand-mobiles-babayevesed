import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../pages/login/login_page.dart';
import '../blocs/log_out/logout_cubit.dart';

class LogOutConfirmationAlert extends StatelessWidget {
  const LogOutConfirmationAlert({Key? key}) : super(key: key);
  Future show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => build(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(di()),
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: Text('Cixis edirsiz!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancel'),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<LogoutCubit>().logOut();
                  },
                  child: (state is LogoutInProgress)
                      ? const CircularProgressIndicator.adaptive()
                      : Text('tamam'))
            ],
          );
        },
      ),
    );
  }
}
