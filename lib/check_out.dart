import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart/model/cart.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, myData, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Total Price is ${myData.totalPrice}'),
          ),
          body: ListView.builder(
              itemCount: myData.items.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: ListTile(
                    title: Text(myData.items[i].name),
                    subtitle: Text('${myData.items[i].price}'),
                    trailing: IconButton(
                        onPressed: () {
                          myData.remove(myData.items[i]);
                        },
                        icon: const Icon(Icons.remove)),
                  )),
                );
              }));
    });
  }
}
