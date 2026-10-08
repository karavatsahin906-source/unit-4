import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(home: Hard2()),
    ),
  );
}

class Product {
  final String id;
  final String name;
  final double price;
  Product(this.id, this.name, this.price);
}

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];
  List<Product> get items => _items;
  double get total => _items.fold(0, (sum, p) => sum + p.price);

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }
}

class Hard2 extends StatelessWidget {
  const Hard2({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(10, (i) => Product('$i', 'Product $i', (i + 1) * 10.0));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hard 2: E-commerce'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (context, i) => Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(products[i].name),
              Text('\$${products[i].price}'),
              ElevatedButton(onPressed: () => context.read<CartModel>().add(products[i]), child: const Text('Add')),
            ],
          ),
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: cart.items.length, itemBuilder: (context, i) => ListTile(title: Text(cart.items[i].name)))),
          Text('Total: \$${cart.total}', style: const TextStyle(fontSize: 24)),
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Summary(total: cart.total))), child: const Text('Checkout'))
        ],
      ),
    );
  }
}

class Summary extends StatelessWidget {
  final double total;
  const Summary({super.key, required this.total});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Summary')), body: Center(child: Text('Total Paid: \$${total}')));
}
