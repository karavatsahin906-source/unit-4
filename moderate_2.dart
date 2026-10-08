import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Moderate2()));
}

class Moderate2 extends StatefulWidget {
  const Moderate2({super.key});

  @override
  State<Moderate2> createState() => _Moderate2State();
}

class _Moderate2State extends State<Moderate2> {
  final List<String> _allNames = [
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grape', 'Honeydew'
  ];
  List<String> _filteredNames = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredNames = _allNames;
  }

  void _filter(String query) {
    setState(() {
      _filteredNames = _allNames
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 2: Search Filter')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: _filter,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredNames.length,
              itemBuilder: (context, index) => ListTile(title: Text(_filteredNames[index])),
            ),
          ),
        ],
      ),
    );
  }
}
