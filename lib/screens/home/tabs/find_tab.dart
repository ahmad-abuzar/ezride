import 'package:flutter/material.dart';
import '../../ride/confirm_driver_sheet.dart';

class FindTab extends StatefulWidget {
  const FindTab({super.key});

  @override
  State<FindTab> createState() => _FindTabState();
}

class _FindTabState extends State<FindTab> {
  final _from = TextEditingController(text: 'B block satellite town');
  final _to = TextEditingController(text: 'Commercial satellite town');
  String _category = 'Comfort';

  @override
  void dispose() {
    _from.dispose();
    _to.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cats = ['Economy','Business','Premium','Comfort'];
    final prices = {'Economy':'370','Business':'400','Premium':'540','Comfort':'1500'};

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          controller: _from,
          decoration: const InputDecoration(prefixIcon: Icon(Icons.location_searching), labelText: 'From'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _to,
          decoration: const InputDecoration(prefixIcon: Icon(Icons.location_on_outlined), labelText: 'To'),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Spacer(),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.attach_money_outlined), label: const Text('Prices')),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final c in cats)
              ChoiceChip(
                label: Text("$c ${prices[c]}"),
                selected: _category == c,
                onSelected: (_) => setState(()=>_category=c),
              ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => const ConfirmDriverSheet(),
              );
            },
            child: const Text('GET A CAR'),
          ),
        ),
        const SizedBox(height: 16),
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
        child: Icon(Icons.map_outlined, size: 120, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
