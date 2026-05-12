import 'package:day2/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.color(context.canvasColor).p12.rounded.make().w32(context).py8();
  }
}
