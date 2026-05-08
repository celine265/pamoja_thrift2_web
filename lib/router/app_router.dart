import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/pages/home_page.dart';
import 'package:pamoja_thrift2_web/pages/features_page.dart';
import 'package:pamoja_thrift2_web/pages/how_it_works_page.dart';
import 'package:pamoja_thrift2_web/pages/download_page.dart';
import 'package:pamoja_thrift2_web/pages/contact_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/features',
        name: 'features',
        builder: (context, state) => const FeaturesPage(),
      ),
      GoRoute(
        path: '/how-it-works',
        name: 'how-it-works',
        builder: (context, state) => const HowItWorksPage(),
      ),
      GoRoute(
        path: '/download',
        name: 'download',
        builder: (context, state) => const DownloadPage(),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        builder: (context, state) => const ContactPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '404',
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Page not found'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}