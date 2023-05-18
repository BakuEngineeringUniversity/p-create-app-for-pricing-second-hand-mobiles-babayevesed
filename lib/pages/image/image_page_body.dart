

import 'package:flutter/material.dart';

class ImagePageBody extends StatelessWidget {
  const ImagePageBody({super.key});
  

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 3);
  }
}