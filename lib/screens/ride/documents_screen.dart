import 'package:flutter/material.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My document')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.badge_outlined),
                  title: const Text('Driving license*'),
                  subtitle: const Text('A Driving license is an official document'),
                  trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline)),
                ),
                Container(height: 140, margin: const EdgeInsets.all(16), color: Theme.of(context).colorScheme.surfaceVariant),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.travel_explore_outlined),
                  title: const Text('Passport'),
                  subtitle: const Text('A passport is an travel document'),
                  trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.upload_outlined)),
                ),
                Container(height: 140, margin: const EdgeInsets.all(16), color: Theme.of(context).colorScheme.surfaceVariant),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
