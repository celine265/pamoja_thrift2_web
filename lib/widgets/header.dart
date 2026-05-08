import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.go('/'),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/logo/logo.png',
                        height: 40,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.store,
                          size: 40,
                          color: AppTheme.primaryGreen,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'PamojaThrift',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                _buildNavLinks(context, currentRoute),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () => context.go('/download'),
                  child: const Text('Download App'),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }

  Widget _buildNavLinks(BuildContext context, String currentRoute) {
    final links = [
      ('/', 'Home'),
      ('/features', 'Features'),
      ('/how-it-works', 'How It Works'),
      ('/download', 'Download'),
      ('/contact', 'Contact'),
    ];

    return Row(
      children: links.map((link) {
        final isActive = currentRoute == link.$1;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextButton(
            onPressed: () => context.go(link.$1),
            style: TextButton.styleFrom(
              foregroundColor: isActive ? AppTheme.primaryGreen : AppTheme.textDark,
            ),
            child: Text(
              link.$2,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}