import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Moderate3()));
}

class Student {
  final String name;
  final String rollNo;
  final int marks;
  Student(this.name, this.rollNo, this.marks);
}

class Moderate3 extends StatelessWidget {
  const Moderate3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 3: Pass Student')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final student = Student('John Doe', 'A101', 85);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(student: student)),
            );
          },
          child: const Text('Send Student Data'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Student student;
  const DetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}', style: const TextStyle(fontSize: 20)),
            Text('Roll No: ${student.rollNo}', style: const TextStyle(fontSize: 20)),
            Text('Marks: ${student.marks}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
