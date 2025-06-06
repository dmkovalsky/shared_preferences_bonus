import 'package:flutter/material.dart';
import 'package:shared_preferences_bonus/data/database_repository.dart';
import 'package:shared_preferences_bonus/data/shared_preferences_repository.dart';
import 'package:shared_preferences_bonus/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseRepository db = SharedPreferencesRepository();
    return MaterialApp(
      home: HomeScreen(db),
    );
  }
}
