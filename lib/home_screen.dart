import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey.shade700,
        title: Text('Add Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Name'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Age'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Salary'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
              ),
              onPressed: () {},
              child: Text('Add Employee'),
            ),
          ],
        ),
      ),
    );
  }
}
