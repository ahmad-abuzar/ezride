import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'status':'Completed','from':'Lahore','to':'Karachi','price':'5200','date':'02/05/2022'},
      {'status':'Cancel','from':'Satellite town Rawalpindi','to':'Satellite town Rawalpindi','price':'1200','date':'08/05/2022'},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final i in items)
          Card(
            child: ListTile(
              leading: Icon(i['status']=='Completed'? Icons.check_circle : Icons.cancel, color: i['status']=='Completed'? Colors.green : Colors.red),
              title: Text('${i['from']} → ${i['to']}'),
              subtitle: Text(i['date']!),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(i['price']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(i['status']!),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
