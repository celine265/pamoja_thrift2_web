import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/pages/home_page.dart';
import 'package:pamoja_thrift2_web/pages/features_page.dart';
import 'package:pamoja_thrift2_web/pages/how_it_works_page.dart';
import 'package:pamoja_thrift2_web/pages/contact_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: '/features',
        name: 'features',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: const FeaturesPage(),
        ),
      ),
      GoRoute(
        path: '/how-it-works',
        name: 'how-it-works',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: const HowItWorksPage(),
        ),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: const ContactPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.search_off_rounded,
                size: 80,
                color: AppTheme.textSubtle,
              ),
              const SizedBox(height: 24),
              const Text(
                '404',
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryGreen,
                  letterSpacing: -2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Page not found',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textLight,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "The page you're looking for doesn't exist or has been moved.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.textSubtle),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => context.go('/'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home_rounded, size: 18),
                    SizedBox(width: 8),
                    Text('Back to Home'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  static CustomTransitionPage _buildPage({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.03),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          ),
        );
      },
    );
  }
}
