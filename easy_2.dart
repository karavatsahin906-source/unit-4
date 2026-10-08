import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Easy2()));
}

class Easy2 extends StatelessWidget {
  const Easy2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 2: ListTile')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text('Person ${index + 1}'),
          );
        },
      ),
    );
  }
}
