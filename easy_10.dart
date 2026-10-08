import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CountNotifier(),
      child: const MaterialApp(home: Easy10()),
    ),
  );
}

class CountNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

class Easy10 extends StatelessWidget {
  const Easy10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 10: read vs watch')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // context.watch() listens for changes and rebuilds this widget
            Text(
              'Count: ${context.watch<CountNotifier>().count}',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // context.read() is used to call a method without listening for changes
                context.read<CountNotifier>().increment();
              },
              child: const Text('Increment (context.read)'),
            ),
          ],
        ),
      ),
    );
  }
}
