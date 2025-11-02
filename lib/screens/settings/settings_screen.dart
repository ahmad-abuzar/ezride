import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(leading: Icon(Icons.phone_outlined), title: Text('Phone Number'), subtitle: Text('92 33176542')),
          ListTile(leading: Icon(Icons.favorite_outline), title: Text('Favorite Address'), subtitle: Text('Lahore')),
          ListTile(leading: Icon(Icons.language_outlined), title: Text('Language'), subtitle: Text('English')),
          SwitchListTile(value: true, onChanged: null, title: Text('Call')),
          SwitchListTile(value: true, onChanged: null, title: Text('Notification')),
        ],
      ),
    );
  }
}
