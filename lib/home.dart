import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart/check_out.dart';
import 'package:provider_cart/model/cart.dart';

import 'model/item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<Item> items = [
    Item(name: "IPhone 14 Pro", price: 2000),
    Item(name: "S20 Ultra", price: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Badge(
              position: BadgePosition.topEnd(top: -5, end: -3),
              badgeContent: Consumer<Cart>(builder: (context, myData, child){
                return Text("${myData.count}");
              },),
              child: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckOut() ));
                },
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              return Card(
                child: Consumer<Cart>(builder: (context, myData, child){
                  return ListTile(
                  title: Text(items[i].name),
                  subtitle: Text('${items[i].price}'),
                  trailing: IconButton(onPressed: () {
                    myData.add(items[i]);
                  }, icon: const Icon(Icons.add)),
                );
                })
              );
            }),
      ),
    );
  }
}
