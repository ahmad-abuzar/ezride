import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final methods = [
      {'icon': Icons.money, 'title': 'Cash', 'subtitle': 'Default Payment Method', 'checked': true},
      {'icon': Icons.credit_card, 'title': '**** **** **** 5967', 'subtitle': 'VISA', 'checked': false},
      {'icon': Icons.account_balance_wallet_outlined, 'title': 'wilson.casper@bernice.info', 'subtitle': 'PayPal', 'checked': true},
      {'icon': Icons.credit_card, 'title': '**** **** **** 3461', 'subtitle': 'Master', 'checked': false},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Payment method')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final m in methods)
            Card(
              child: ListTile(
                leading: Icon(m['icon'] as IconData),
                title: Text(m['title'] as String),
                subtitle: Text(m['subtitle'] as String),
                trailing: (m['checked'] as bool)
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
              ),
            ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.add),
              label: const Text('Add New Method'),
            ),
          ),
        ],
      ),
    );
  }
}
