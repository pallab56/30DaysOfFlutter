import 'package:day2/models/catalog.dart';
import 'package:day2/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({required this.catalog, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.imageUrl),
            ).centered(),

            Expanded(
              child: VxArc(
                height: 25,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      7.heightBox,
                      catalog.name.text.xl4.bold
                          .color(MyThemes.darkBluishColor)
                          .make(),
                      7.heightBox,
                      catalog.description.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      20.heightBox,
                      "Dolor sed eirmod takimata ea dolor. Ea elitr no labore nonumy. Rebum no est gubergren sadipscing clita et eos gubergren."
                          .text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: OverflowBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}".text.bold.xl3.red800.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(MyThemes.darkBluishColor),
            ),
            child: "Add to Cart".text.xl.color(Colors.white).make(),
          ).wh(130, 40).pOnly(right: 8),
        ],
      ).p16(),
    );
  }
}
