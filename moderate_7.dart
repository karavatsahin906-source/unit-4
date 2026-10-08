import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Moderate7()));
}

class Moderate7 extends StatefulWidget {
  const Moderate7({super.key});

  @override
  State<Moderate7> createState() => _Moderate7State();
}

class _Moderate7State extends State<Moderate7> {
  final List<String> _todos = [];
  final _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 7: To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'New Task'),
                  ),
                ),
                IconButton(onPressed: _addTodo, icon: const Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_todos[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => setState(() => _todos.removeAt(index)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
