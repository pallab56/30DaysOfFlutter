import 'package:day2/models/catalog.dart';
import 'package:day2/pages/home_details_page.dart';
import 'package:day2/widgets/home_widgets/catalog_images.dart';
import 'package:day2/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeDetailsPage(catalog: catalog)));
          },
          child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({required this.catalog, super.key})
    // : assert(catalog != null)
    ;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.imageUrl)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.xl.bold.color(MyThemes.darkBluishColor).make(),
              catalog.description.text.lg
                  .textStyle(context.captionStyle)
                  .make(),
              7.heightBox,
              OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl
                      .color(MyThemes.darkBluishColor)
                      .make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        MyThemes.darkBluishColor,
                      ),
                    ),
                    child: "Buy".text.lg.color(Colors.white).make(),
                  ).pOnly(right: 8),
                ],
              ),
            ],
          ).px8().expand(),
        ],
      ),
    ).white.rounded.square(140).make().py8();
  }
}
