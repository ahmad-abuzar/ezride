import 'package:flutter/material.dart';
import 'tabs/find_tab.dart';
import 'tabs/offers_tab.dart';
import 'tabs/history_tab.dart';
import 'tabs/account_tab.dart';

class HomeShell extends StatefulWidget {
  static const route = '/home';
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;
  final _tabs = const [FindTab(), OffersTab(), HistoryTab(), AccountTab()];

  String get _title => ['Home','Offers','Ride History','Account'][_index];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: IndexedStack(index: _index, children: _tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i)=>setState(()=>_index=i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.local_offer_outlined), label: 'Offers'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), label: 'Ride History'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}
