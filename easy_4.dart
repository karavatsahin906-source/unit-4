import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Easy4Home()));
}

class Easy4Home extends StatelessWidget {
  const Easy4Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 4: HomeScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Easy4Second()),
            );
          },
          child: const Text('Go to SecondScreen'),
        ),
      ),
    );
  }
}

class Easy4Second extends StatelessWidget {
  const Easy4Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 4: SecondScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
