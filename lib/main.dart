import 'package:bkey_user/services/onboarding_services.dart';
import 'package:bkey_user/services/user_services.dart';
import 'package:bkey_user/views/forgot_password_view.dart';
import 'package:bkey_user/views/login_view.dart';
import 'package:bkey_user/views/onbaording_view.dart';
import 'package:bkey_user/views/signup_view.dart';
import 'package:bkey_user/widget/bottom_nav.dart';
import 'package:bkey_user/views/bus_list_view.dart';
import 'package:bkey_user/services/storage_services.dart';
import 'package:bkey_user/views/started_view.dart';
import 'package:bkey_user/views/wallet_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage service once
  await StorageService.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final bool _alreadyShown;
  late final bool _isLogin;
  @override
  void initState() {
    super.initState();
    _alreadyShown = OnboardingManager.isShown();
    _isLogin = UserStorage.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder:
              (_, __) =>
                  _alreadyShown
                      ? _isLogin
                          ? BottomNav()
                          : StartedScreen()
                      : OnboardingScreen(),
        ),
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
  }
}
