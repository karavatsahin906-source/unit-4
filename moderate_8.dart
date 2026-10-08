import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MaterialApp(home: Moderate8()),
    ),
  );
}

class Item {
  final String name;
  final double price;
  Item(this.name, this.price);
}

class CartProvider extends ChangeNotifier {
  final List<Item> _cartItems = [];
  List<Item> get items => _cartItems;

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + item.price);

  void addItem(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}

class Moderate8 extends StatelessWidget {
  const Moderate8({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> availableItems = [
      Item('Apple', 1.99),
      Item('Banana', 0.99),
      Item('Orange', 1.49),
      Item('Grapes', 2.99),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 8: Shopping Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: availableItems.length,
              itemBuilder: (context, index) {
                final item = availableItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () => context.read<CartProvider>().addItem(item),
                    child: const Text('Add'),
                  ),
                );
              },
            ),
          ),
          const Divider(thickness: 2),
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Cart Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text('Items in Cart: ${cart.items.length}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
