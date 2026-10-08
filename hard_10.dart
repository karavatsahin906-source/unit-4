import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MaterialApp(home: Hard10()),
    ),
  );
}

class User {
  final String username;
  final String password;
  User(this.username, this.password);
}

class UserProvider extends ChangeNotifier {
  final List<User> _users = [
    User('admin', 'admin123'),
    User('user1', 'pass1'),
    User('test', 'test'),
  ];

  bool validate(String username, String password) {
    return _users.any((u) => u.username == username && u.password == password);
  }
}

class Hard10 extends StatefulWidget {
  const Hard10({super.key});

  @override
  State<Hard10> createState() => _Hard10State();
}

class _Hard10State extends State<Hard10> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      final isValid = context.read<UserProvider>().validate(
        _userController.text,
        _passController.text,
      );

      if (isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 10: Multi-user Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (v) => v!.isEmpty ? 'Enter username' : null,
              ),
              TextFormField(
                controller: _passController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (v) => v!.isEmpty ? 'Enter password' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: const Text('Login')),
              const SizedBox(height: 20),
              const Text('Try: admin/admin123, user1/pass1, test/test'),
            ],
          ),
        ),
      ),
    );
  }
}
