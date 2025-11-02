import 'package:flutter/material.dart';
import '../chat/chat_screen.dart';

class ConfirmDriverSheet extends StatelessWidget {
  const ConfirmDriverSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16, right: 16, top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(radius: 28, child: Icon(Icons.person)),
          const SizedBox(height: 8),
          const Text('Gregory Hayes', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, size: 16), SizedBox(width: 4), Text('4.9 (1234)'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _Info(label:'Distance', value:'0.2 km'),
              _Info(label:'Time', value:'2 min'),
              _Info(label:'Price', value:'\$25.00'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.chat_bubble_outline)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                Navigator.pop(context);
                await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Booking Successful'),
                    content: const Text('Your booking has been confirmed. Driver will pickup you in 2 minutes.'),
                    actions: [
                      TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('Done'))
                    ],
                  ),
                );
                if (context.mounted) {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const ChatScreen()));
                }
              },
              child: const Text('Confirm'),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final String label;
  final String value;
  const _Info({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
