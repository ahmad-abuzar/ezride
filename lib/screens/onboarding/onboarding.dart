import 'package:flutter/material.dart';
import '../auth/sign_in_screen.dart';

class Onboarding extends StatefulWidget {
  static const route = '/';
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();
  int _index = 0;

  final _pages = const [
    _Slide(
      title1: 'Quick',
      title2: 'start',
      body: 'Get a head start with Quick Start, instantly boosting your progress and unlocking rewards right from the beginning.',
      icon: Icons.rocket_launch_outlined,
    ),
    _Slide(
      title1: 'Exceptional',
      title2: 'bonuses',
      body: 'Unlock Exceptional Bonuses with special events, multiplying your earnings and rewards for even greater benefits!',
      icon: Icons.local_activity_outlined,
    ),
    _Slide(
      title1: 'Multiplied',
      title2: 'Earning',
      body: 'Earn rewards faster with our Multiplied Earnings feature during special promotions or events!',
      icon: Icons.trending_up_outlined,
    ),
  ];

  void _next() {
    if (_index == _pages.length - 1) {
      Navigator.pushReplacementNamed(context, SignInScreen.route);
    } else {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _index = i),
                children: _pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Row(
                    children: List.generate(_pages.length, (i) {
                      final active = i == _index;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: active ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: active ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  FilledButton.tonalIcon(
                    onPressed: _next,
                    icon: const Icon(Icons.arrow_forward),
                    label: Text(_index == _pages.length - 1 ? 'Start' : 'Next'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title1;
  final String title2;
  final String body;
  final IconData icon;
  const _Slide({required this.title1, required this.title2, required this.body, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Center(
              child: Icon(icon, size: 140, color: Theme.of(context).colorScheme.primary),
            ),
          ),
          Text(title1, style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700)),
          Text(title2, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 8),
          Text(body, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
