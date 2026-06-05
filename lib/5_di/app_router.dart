// lib/5_di/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../4_features/splash/presentation/splash_screen.dart';
import '../4_features/onboarding/presentation/pages/onboarding_screen.dart';
import '../4_features/auth/presentation/pages/login_screen.dart';
import '../4_features/auth/presentation/pages/register_screen.dart';

// ─── Placeholder Screen ───────────────────────────────────────────────────────
class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07070F),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFF5F5FF),
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// ─── Router Provider ──────────────────────────────────────────────────────────
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Home'),
      ),
      GoRoute(
        path: '/learning',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Learning'),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Profile'),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Settings'),
      ),
    ],
  );
});