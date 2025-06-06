import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Shared Preferences Bonus Task')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                spacing: 16,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Benutzername',
                      hintText: 'Geben Sie Ihren Benutzernamen ein',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: Text('Speichern'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
