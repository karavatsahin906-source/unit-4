import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MaterialApp(home: Easy9()),
    ),
  );
}

class CounterModel extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

class Easy9 extends StatelessWidget {
  const Easy9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 9: Provider Consumer')),
      body: Center(
        child: Consumer<CounterModel>(
          builder: (context, model, child) {
            return Text('Value: ${model.value}', style: const TextStyle(fontSize: 32));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterModel>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
