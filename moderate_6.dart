import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Moderate6()));
}

class Moderate6 extends StatefulWidget {
  const Moderate6({super.key});

  @override
  State<Moderate6> createState() => _Moderate6State();
}

class _Moderate6State extends State<Moderate6> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  String _error = '';

  void _login() {
    if (_userController.text == 'admin' && _passController.text == '1234') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Moderate6Home()));
    } else {
      setState(() => _error = 'Invalid Credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 6: Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _userController, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: _passController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 10),
            Text(_error, style: const TextStyle(color: Colors.red)),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}

class Moderate6Home extends StatelessWidget {
  const Moderate6Home({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Home Screen')), body: const Center(child: Text('Welcome!')));
}
