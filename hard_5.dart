import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Hard5()));
}

class Hard5 extends StatefulWidget {
  const Hard5({super.key});

  @override
  State<Hard5> createState() => _Hard5State();
}

class _Hard5State extends State<Hard5> {
  bool _isList = true;
  final List<String> _items = List.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hard 5: Toggle View'),
        actions: [
          IconButton(
            icon: Icon(_isList ? Icons.grid_view : Icons.list),
            onPressed: () => setState(() => _isList = !_isList),
          )
        ],
      ),
      body: _isList 
        ? ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, i) => ListTile(title: Text(_items[i])),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: _items.length,
            itemBuilder: (context, i) => Card(child: Center(child: Text(_items[i]))),
          ),
    );
  }
}
