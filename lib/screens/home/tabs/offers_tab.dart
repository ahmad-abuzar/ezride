import 'package:flutter/material.dart';

class OffersTab extends StatelessWidget {
  const OffersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: const Text('Ahmed ali'),
          subtitle: Row(
            children: const [
              Icon(Icons.timer_outlined, size: 16),
              SizedBox(width: 4),
              Text('15 Min  '),
              Icon(Icons.star_rate, size: 16),
              SizedBox(width: 4),
              Text('4.0'),
            ],
          ),
          trailing: Wrap(
            spacing: 8,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.chat_bubble_outline)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        TextField(decoration: const InputDecoration(prefixIcon: Icon(Icons.radio_button_checked), labelText: '02:10 PM  Lahore')),
        const SizedBox(height: 8),
        TextField(decoration: const InputDecoration(prefixIcon: Icon(Icons.location_on), labelText: '02:30 PM  Karachi')),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: FilledButton(onPressed: (){}, child: const Text('End the ride'))),
        const SizedBox(height: 24),
        const SizedBox(height: 300, child: _FakeMap()),
      ],
    );
  }
}

class _FakeMap extends StatelessWidget {
  const _FakeMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: Center(
        child: Icon(Icons.navigation_outlined, size: 120, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
