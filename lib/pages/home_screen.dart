import 'dart:convert';

import 'package:day2/models/catalog.dart';
import 'package:day2/widgets/item_widget.dart';
import 'package:day2/widgets/mydrawer.dart';
import 'package:day2/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );

    final decodeData = jsonDecode(catalogJson);
    // var decodeData = JsonDecoder().convert(catalogJson);
    var productsData = decodeData["products"];

    CatalogModel.items = List.from(
      productsData,
    ).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20,(index)=>CatalogModel.items[0]);
    return Scaffold(
      // appBar: AppBar(title: Center(child: Text("HomeScreen"))),
      // drawer: Mydrawer(),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: (CatalogModel.items != Null && CatalogModel.items.isNotEmpty)
      //       ?
      //         // ListView.builder(
      //         //   itemCount:CatalogModel.items.length,
      //         //   itemBuilder: (context , index){
      //         //     return ItemWidget(item: CatalogModel.items[index]);
      //         // })
      //         GridView.builder(
      //           clipBehavior: Clip.none,
      //           padding: EdgeInsets.all(12),
      //           cacheExtent: 12,
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             mainAxisSpacing: 12,
      //             crossAxisSpacing: 12
      //           ),
      //           itemCount: CatalogModel.items.length,
      //           itemBuilder: (context, index) {
      //             final item = CatalogModel.items[index];
      //             return Card(
      //               child: GridTile(
      //                 header: Container(
      //                   padding: EdgeInsets.all(5),
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(8),
      //                     color: Colors.deepPurple,
      //                   ),
      //                   child: Padding(
      //                     padding:  const EdgeInsets.symmetric(horizontal: 10),
      //                     child: Text(
      //                       item.name,
      //                       style: TextStyle(color: Colors.white, fontSize: 16),
      //                     ),
      //                   ),
      //                 ),
      //                 footer: Container(
      //                   padding: EdgeInsets.all(5),
      //                   decoration: BoxDecoration(
      //                     color: Colors.deepPurple,
      //                     shape: BoxShape.rectangle,
      //                     borderRadius: BorderRadius.circular(3),
      //                   ),
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 10),
      //                     child: Text(
      //                       item.price.toString(),
      //                       style: TextStyle(color: Colors.white, fontSize: 18),
      //                     ),
      //                   ),
      //                 ),
      //                 child: Image.network(item.imageUrl),
      //               ),
      //             );
      //           },
      //         )
      //       : Center(child: CircularProgressIndicator()),
      // ),
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CatalogHeader(),
              (CatalogModel.items != Null && CatalogModel.items.isNotEmpty)
                  ? CatalogList().expand()
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        "Catalog App".text.xl4.bold.color(MyThemes.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({required this.catalog, super.key})
    : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.imageUrl),
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

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.p12.rounded.color(MyThemes.creamColor).make().w32(context).py8();
  }
}
