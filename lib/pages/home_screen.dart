import 'package:day2/models/catalog.dart';
import 'package:day2/widgets/item_widget.dart';
import 'package:day2/widgets/mydrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
