import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/onboarding/onboarding.dart';
import 'screens/auth/sign_in_screen.dart';
import 'screens/auth/sign_up_screen.dart';
import 'screens/home/home_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EzRidesApp());
}

class EzRidesApp extends StatelessWidget {
  const EzRidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EzRides',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFf4a300),
        brightness: Brightness.light,
      ),
      initialRoute: Onboarding.route,
      routes: {
        Onboarding.route: (_) => const Onboarding(),
        SignInScreen.route: (_) => const SignInScreen(),
        SignUpScreen.route: (_) => const SignUpScreen(),
        HomeShell.route: (_) => const HomeShell(),
      },
    );
  }
}
