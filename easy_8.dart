import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Easy8()));
}

class Easy8 extends StatefulWidget {
  const Easy8({super.key});

  @override
  State<Easy8> createState() => _Easy8State();
}

class _Easy8State extends State<Easy8> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 8: Checkbox')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (val) => setState(() => _isChecked = val!),
            ),
            Text(_isChecked ? 'Checked' : 'Unchecked', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
