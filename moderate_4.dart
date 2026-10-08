import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Moderate4Home()));
}

class Moderate4Home extends StatelessWidget {
  const Moderate4Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 4: Return Data')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Moderate4Detail()),
            );
            if (context.mounted && result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Received: $result')),
              );
            }
          },
          child: const Text('Go to Detail Screen'),
        ),
      ),
    );
  }
}

class Moderate4Detail extends StatelessWidget {
  const Moderate4Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'Data from Detail Screen');
          },
          child: const Text('Send Data Back'),
        ),
      ),
    );
  }
}
