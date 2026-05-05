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

    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
  
    final decodeData = jsonDecode(catalogJson);
    // var decodeData = JsonDecoder().convert(catalogJson);
   var productsData = decodeData["products"];
   print(productsData);
  }
  
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20,(index)=>CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("HomeScreen"))),
      drawer: Mydrawer(),
      body: ListView.builder(
        itemCount:dummyList.length,
        itemBuilder: (context , index){
          return ItemWidget(item: dummyList[index]);
      })
        );
   
  }
}
