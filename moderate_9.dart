import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Moderate9()));
}

class Moderate9 extends StatefulWidget {
  const Moderate9({super.key});

  @override
  State<Moderate9> createState() => _Moderate9State();
}

class _Moderate9State extends State<Moderate9> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 9: Star Rating')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Rating: $_rating / 5', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  ),
                  onPressed: () => setState(() => _rating = index + 1),
                );
              }),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _rating = 0),
              child: const Text('Reset'),
            )
          ],
        ),
      ),
    );
  }
}
