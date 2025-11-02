import 'package:flutter/material.dart';
import '../../payments/earning_screen.dart';
import '../../payments/payment_methods_screen.dart';
import '../../settings/settings_screen.dart';
import '../../ride/documents_screen.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const ListTile(
          leading: CircleAvatar(child: Text('A')),
          title: Text('Ahmed ali'),
        ),
        const SizedBox(height: 8),
        _tile(context, Icons.account_balance_wallet_outlined, 'Earning', (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const EarningScreen()));
        }),
        _tile(context, Icons.credit_card, 'Payment method', (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const PaymentMethodsScreen()));
        }),
        _tile(context, Icons.description_outlined, 'My document', (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const DocumentsScreen()));
        }),
        _tile(context, Icons.settings_outlined, 'Setting', (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const SettingsScreen()));
        }),
        _tile(context, Icons.logout, 'Log Out', (){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged out (demo)')));
        }),
      ],
    );
  }

  Widget _tile(BuildContext context, IconData icon, String title, VoidCallback onTap){
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
