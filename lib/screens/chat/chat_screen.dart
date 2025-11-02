import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {'me': false, 'text': 'Hello, are you nearby?', 'time': 'Today at 5:03 PM'},
      {'me': true, 'text': 'I\'ll be there in a few mins', 'time': ''},
      {'me': false, 'text': 'OK, I am waiting at Vinmark Store', 'time': '5:33 PM'},
      {'me': true, 'text': 'Sorry, I\'m stuck in traffic. Please give me a moment.', 'time': ''},
    ];
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(radius: 14, child: Icon(Icons.person, size: 16)),
            SizedBox(width: 8),
            Text('Ahmed Ali'),
            SizedBox(width: 8),
            Text('• Active now', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, i) {
                final m = messages[i];
                final me = m['me'] as bool;
                final align = me ? Alignment.centerRight : Alignment.centerLeft;
                final color = me ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surfaceVariant;
                final textColor = me ? Theme.of(context).colorScheme.onPrimary : null;
                return Column(
                  crossAxisAlignment: me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    if ((m['time'] as String).isNotEmpty) Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text(m['time'] as String, style: Theme.of(context).textTheme.labelSmall)),
                    Align(
                      alignment: align,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
                        child: Text(m['text'] as String, style: TextStyle(color: textColor)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 12 + MediaQuery.of(context).viewInsets.bottom),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller, decoration: const InputDecoration(hintText: 'Write your message'))),
                IconButton(onPressed: (){}, icon: const Icon(Icons.send)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
