import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telefonchu/features/models/presentation/blocs/image/image_cubit.dart';
import 'package:telefonchu/pages/image/image_page_body.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          return const Scaffold(
            body: ImagePageBody(),
          );
        },
      ),
    );
  }
}
