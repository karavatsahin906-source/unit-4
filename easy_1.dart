import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Easy1()));
}

class Easy1 extends StatelessWidget {
  const Easy1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'John', 'Jane', 'Doe', 'Smith', 'Alice', 
      'Bob', 'Charlie', 'David', 'Eve', 'Frank'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Easy 1: List of Names')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(names[index], style: const TextStyle(fontSize: 18)),
          );
        },
      ),
    );
  }
}
