import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Moderate1()));
}

class Product {
  final String name;
  final double price;
  Product(this.name, this.price);
}

class Moderate1 extends StatelessWidget {
  const Moderate1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = List.generate(
      12, (index) => Product('Product ${index + 1}', (index + 1) * 15.0)
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 1: Product Catalog')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 40, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${p.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green)),
              ],
            ),
          );
        },
      ),
    );
  }
}
