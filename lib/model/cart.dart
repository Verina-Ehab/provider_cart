import 'package:flutter/material.dart';

import 'item.dart';

class Cart with ChangeNotifier{
  List<Item> items=[];
  double myTotalPrice =0.0;

  void add(Item item){
    items.add(item);
    myTotalPrice += item.price;
    notifyListeners();
  }

  void remove(Item item){
    items.remove(item);
    myTotalPrice -= item.price;
    notifyListeners();
  }

  int get count{
    return items.length;
  }

  double get totalPrice{
    return myTotalPrice;
  }
}