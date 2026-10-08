import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Moderate10()));
}

class Moderate10 extends StatefulWidget {
  const Moderate10({super.key});

  @override
  State<Moderate10> createState() => _Moderate10State();
}

class _Moderate10State extends State<Moderate10> {
  int _n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 10: Star Pattern')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter number of rows'),
              onChanged: (val) => setState(() => _n = int.tryParse(val) ?? 0),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _n,
                itemBuilder: (context, index) {
                  return Text('* ' * (index + 1), style: const TextStyle(fontSize: 20));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
