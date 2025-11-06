import 'package:bkey_user/auth/forgot_password_screen.dart';
import 'package:bkey_user/auth/login_screen.dart';
import 'package:bkey_user/auth/signup_screen.dart';
import 'package:bkey_user/bottom_nav.dart';
import 'package:bkey_user/bus/bus_list_screen.dart';
import 'package:bkey_user/onboarding/onboarding_screen.dart';
import 'package:bkey_user/services/onboarding_storage.dart';
import 'package:bkey_user/started_screen.dart';
import 'package:bkey_user/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<bool> _alreadyShownFuture;

  @override
  void initState() {
    super.initState();
    _alreadyShownFuture = OnboardingStorage.isShown();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _alreadyShownFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        final alreadyShown = snapshot.data!;

        final GoRouter router = GoRouter(
          routes: [
            GoRoute(path: '/', builder: (_, __) => alreadyShown ? const BottomNav() : OnboardingScreen()),
            GoRoute(path: '/started', builder: (_, __) => const StartedScreen()),
            GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
            GoRoute(path: '/sign-up', builder: (_, __) => const SignupScreen()),
            GoRoute(path: '/forgot-password', builder: (_, __) => const ForgotPasswordScreen()),
            GoRoute(path: '/bottom-nav', builder: (_, __) => const BottomNav()),
            GoRoute(path: '/wallet', builder: (_, __) => const WalletScreen()),
            GoRoute(path: '/bus-list', builder: (_, __) => const BusListScreen()),
          ],
        );

        return MaterialApp.router(routerConfig: router, debugShowCheckedModeBanner: false);
      },
    );
  }
}
