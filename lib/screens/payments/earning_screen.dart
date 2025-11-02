import 'package:flutter/material.dart';

class EarningScreen extends StatelessWidget {
  const EarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Earning')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.payments_outlined),
              title: const Text('Cash Payment'),
              subtitle: const Text('Default method'),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
              onTap: (){},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Master Card'),
              subtitle: const Text('**** **** **** 4584'),
              onTap: (){},
            ),
          ),
          const SizedBox(height: 16),
          Text('Recent Activity', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          for (int i=0;i<3;i++)
            Card(
              child: ListTile(
                leading: const Icon(Icons.place_outlined),
                title: const Text('Lahore'),
                subtitle: const Text('Lahore St • 16/10/19'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('\$25', style: TextStyle(fontWeight: FontWeight.w600)),
                    Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.star, size: 14), Text('4.4')]),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
