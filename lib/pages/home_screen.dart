import 'dart:convert';
import 'package:day2/models/catalog.dart';
import 'package:day2/pages/cart_page.dart';
import 'package:day2/widgets/home_widgets/catalog_header.dart';
import 'package:day2/widgets/home_widgets/catalog_list.dart';
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
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        // backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.shopping_cart_outlined, color: context.cardColor),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CatalogHeader(),
              (CatalogModel.items != Null && CatalogModel.items.isNotEmpty)
                  ? CatalogList().expand()
                  : CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
