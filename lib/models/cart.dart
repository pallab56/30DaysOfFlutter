// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:day2/models/catalog.dart';

class CartModel {
  //catalog fields
  CatalogModel? _catalog ;
 

  // collection of id's - store id's of each item
  final List<int> _itemIds = [];

  //get catalog 
  CatalogModel get catalog =>_catalog!;
  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
  }
  // get item's in the cart
  List<Item> get items =>_itemIds.map((id)=>_catalog!.getById(id)).toList();
  //get Total price

num get totalPrice => items.fold(0, (total,current)=>
                                total + current.price);

// add item 
void add(Item item){
  _itemIds.add(item.id);
}

// remove item
void removeId(Item item){
  _itemIds.remove(item.id);
}
}
