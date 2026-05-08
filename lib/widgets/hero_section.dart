import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showButtons;

  const HeroSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.showButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppTheme.textLight,
                    height: 1.6,
                  ),
                ),
                if (showButtons) ...[
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go('/download'),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.download),
                            SizedBox(width: 8),
                            Text('Download App'),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () => context.go('/how-it-works'),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.play_circle_outline),
                            SizedBox(width: 8),
                            Text('Learn More'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: Image.asset(
              'assets/logo/logo.png',
              height: 280,
              errorBuilder: (_, __, ___) => Container(
                height: 280,
                decoration: BoxDecoration(
                  color: AppTheme.lightGreen,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(
                    Icons.store,
                    size: 120,
                    color: AppTheme.primaryGreen,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}