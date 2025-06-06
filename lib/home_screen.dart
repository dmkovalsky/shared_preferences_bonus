import 'package:flutter/material.dart';
import 'package:shared_preferences_bonus/data/database_repository.dart';

class HomeScreen extends StatefulWidget {
  // Parameters
  final DatabaseRepository db;

  // Constructor
  const HomeScreen(
    this.db, {
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _username = '';
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    _username = await widget.db.getUsername();
    setState(() {});
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences Bonus Task')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              spacing: 16,
              children: [
                Text(
                  'Willkommen, ${_username.isNotEmpty ? _username : "Gast"}!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: _username.isNotEmpty
                        ? _username
                        : "Benutzername",
                    hintText: 'Benutzername eingeben',
                    border: OutlineInputBorder(),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    final String username = _usernameController.text.trim();
                    if (username.isNotEmpty) {
                      widget.db.saveUsername(username);
                      _loadUsername();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Benutzername gespeichert: $username'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Bitte geben Sie einen Benutzernamen ein',
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Speichern'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
