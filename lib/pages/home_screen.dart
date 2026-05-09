import 'dart:convert';

import 'package:day2/models/catalog.dart';
import 'package:day2/widgets/item_widget.dart';
import 'package:day2/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
   loadData() async{

    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
  
    final decodeData = jsonDecode(catalogJson);
    // var decodeData = JsonDecoder().convert(catalogJson);
   var productsData = decodeData["products"];

    CatalogModel.items = List.from(productsData)
    .map<Item>((item)=>Item.fromMap(item))
    .toList();

    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20,(index)=>CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("HomeScreen"))),
      drawer: Mydrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:(CatalogModel.items!=Null && CatalogModel.items.isNotEmpty)? ListView.builder(
          itemCount:CatalogModel.items.length,
          itemBuilder: (context , index){
            return ItemWidget(item: CatalogModel.items[index]);
        }):Center(
          child: CircularProgressIndicator(),
        )
      )
        );
   
  }
}
