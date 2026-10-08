import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: Hard3())));
}

class Todo {
  final String id;
  final String title;
  final bool isCompleted;
  Todo(this.id, this.title, this.isCompleted);
}

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void add(String title) {
    state = [...state, Todo(DateTime.now().toString(), title, false)];
  }

  void remove(String id) {
    state = state.where((t) => t.id != id).toList();
  }

  void toggle(String id) {
    state = state.map((t) => t.id == id ? Todo(t.id, t.title, !t.isCompleted) : t).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());

class Hard3 extends ConsumerWidget {
  const Hard3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Hard 3: Riverpod Todo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller, decoration: const InputDecoration(labelText: 'Task'))),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      ref.read(todoProvider.notifier).add(controller.text);
                      controller.clear();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, i) => ListTile(
                leading: Checkbox(
                  value: todos[i].isCompleted,
                  onChanged: (_) => ref.read(todoProvider.notifier).toggle(todos[i].id),
                ),
                title: Text(todos[i].title, style: TextStyle(decoration: todos[i].isCompleted ? TextDecoration.lineThrough : null)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => ref.read(todoProvider.notifier).remove(todos[i].id),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
