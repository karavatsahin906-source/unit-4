import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Hard1()));
}

class Hard1 extends StatefulWidget {
  const Hard1({super.key});

  @override
  State<Hard1> createState() => _Hard1State();
}

class _Hard1State extends State<Hard1> {
  int _currentStep = 0;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _address = '';
  String _phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 1: Form Wizard')),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep == 0) {
            if (_formKey1.currentState!.validate()) {
              _formKey1.currentState!.save();
              setState(() => _currentStep++);
            }
          } else if (_currentStep == 1) {
            if (_formKey2.currentState!.validate()) {
              _formKey2.currentState!.save();
              setState(() => _currentStep++);
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Form Submitted Successfully!')),
            );
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          }
        },
        steps: [
          Step(
            title: const Text('Personal Info'),
            isActive: _currentStep >= 0,
            content: Form(
              key: _formKey1,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (v) => v!.isEmpty ? 'Field required' : null,
                    onSaved: (v) => _name = v!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (v) => !v!.contains('@') ? 'Invalid email' : null,
                    onSaved: (v) => _email = v!,
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Address'),
            isActive: _currentStep >= 1,
            content: Form(
              key: _formKey2,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: (v) => v!.isEmpty ? 'Field required' : null,
                    onSaved: (v) => _address = v!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Phone'),
                    validator: (v) => v!.isEmpty ? 'Field required' : null,
                    onSaved: (v) => _phone = v!,
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Review'),
            isActive: _currentStep >= 2,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: $_name'),
                Text('Email: $_email'),
                Text('Address: $_address'),
                Text('Phone: $_phone'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
