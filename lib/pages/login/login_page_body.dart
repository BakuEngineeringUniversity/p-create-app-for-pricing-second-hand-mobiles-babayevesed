import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/login/presentation/blocs/login/login_cubit.dart';
import 'package:telefonchu/injection_container.dart';
import 'package:telefonchu/pages/home_page/home_page.dart';
import 'package:telefonchu/shared/widgets/text_field.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(di()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .2),
                  const Text(
                    "Daxil ol",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      title: "Email",
                      keyBoardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      title: "Sifre",
                      obsecureText: true,
                      maxLines: 1,
                      onChanged: (value) {
                        password = value;
                      }),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().login(email ?? '', password ?? '');
                      },
                      child: (state is LoginInProgress)
                          ? const CircularProgressIndicator.adaptive()
                          : const Text('Login'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
