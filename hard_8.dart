import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Hard8()));
}

class Hard8 extends StatefulWidget {
  const Hard8({super.key});

  @override
  State<Hard8> createState() => _Hard8State();
}

class _Hard8State extends State<Hard8> {
  int _n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 8: Pyramid Pattern')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter N for pyramid levels'),
              onChanged: (val) => setState(() => _n = int.tryParse(val) ?? 0),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _n,
                itemBuilder: (context, index) {
                  int rowNum = index + 1;
                  String rowText = List.generate(rowNum, (i) => '$rowNum').join(' ');
                  return Center(
                    child: Text(
                      rowText,
                      style: const TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
