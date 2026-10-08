import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Hard6()));
}

class Hard6 extends StatefulWidget {
  const Hard6({super.key});

  @override
  State<Hard6> createState() => _Hard6State();
}

class _Hard6State extends State<Hard6> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _city = 'Surat';
  bool _agree = false;

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Hard6Summary(name: _name, city: _city, agree: _agree),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 6: Complex Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Please enter name' : null,
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _city,
                decoration: const InputDecoration(labelText: 'City'),
                items: ['Surat', 'Ahmedabad', 'Mumbai', 'Delhi'].map((city) {
                  return DropdownMenuItem(value: city, child: Text(city));
                }).toList(),
                onChanged: (val) => setState(() => _city = val!),
              ),
              const SizedBox(height: 10),
              FormField<bool>(
                initialValue: _agree,
                validator: (value) => _agree == false ? 'You must accept terms' : null,
                builder: (formState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _agree,
                            onChanged: (val) {
                              setState(() => _agree = val!);
                              formState.didChange(val);
                            },
                          ),
                          const Text('I agree to Terms & Conditions'),
                        ],
                      ),
                      if (formState.hasError)
                        Text(formState.errorText!, style: const TextStyle(color: Colors.red, fontSize: 12)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _saveForm, child: const Text('Submit & Go to Summary')),
            ],
          ),
        ),
      ),
    );
  }
}

class Hard6Summary extends StatelessWidget {
  final String name;
  final String city;
  final bool agree;

  const Hard6Summary({super.key, required this.name, required this.city, required this.agree});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: const TextStyle(fontSize: 20)),
            Text('City: $city', style: const TextStyle(fontSize: 20)),
            Text('Agreed to Terms: ${agree ? "Yes" : "No"}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
