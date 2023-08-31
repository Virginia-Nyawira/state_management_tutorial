import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Item{
  late String itemName;
  late int itemPrice;
  late Image itemImage;

}
class CartModel extends ChangeNotifier{
  // Internal, private state of the cart.
  final List<Item> _items=[];

  // An unmodifiable view of the items in the cart.
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // The current total price of all items (assuming all items cost Ksh. 42).
  int get totalPrice => _items.length * 42;
// Adds [item] to cart. This and [removeAll] are the only ways to modify the
// cart from the outside.
   void addItem(Item item) {
     _items.add(item);
     notifyListeners(); // This call tells the widgets that are listening to this model to rebuild.
   }
//Removes all the items from the List
   void removeAll(){
     _items.clear();
     notifyListeners();
   }

}
class HomePageProvider extends StatefulWidget {
  const HomePageProvider({super.key});

  @override
  State<HomePageProvider> createState() => _HomePageProviderState();
}

class _HomePageProviderState extends State<HomePageProvider> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (context,cart,child)=>Text('Total Price: ${cart.totalPrice}'),
    );
  }
}

