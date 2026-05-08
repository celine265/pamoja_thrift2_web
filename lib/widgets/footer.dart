import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.darkGreen,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/logo/logo.png',
                                height: 32,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.store,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'PamojaThrift',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Kenya\'s trusted marketplace for second-hand goods. Buy and sell sustainably with PamojaThrift.',
                            style: TextStyle(
                              color: Colors.white70,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Quick Links',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildLink(context, '/', 'Home'),
                          _buildLink(context, '/features', 'Features'),
                          _buildLink(context, '/how-it-works', 'How It Works'),
                          _buildLink(context, '/download', 'Download'),
                          _buildLink(context, '/contact', 'Contact'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildContactItem(Icons.email, 'support@pamojathrift.com'),
                          _buildContactItem(Icons.phone, '+254 700 000 000'),
                          _buildContactItem(Icons.location_on, 'Nairobi, Kenya'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Divider(color: Colors.white24),
                const SizedBox(height: 24),
                const Text(
                  '© 2026 PamojaThrift. All rights reserved.',
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLink(BuildContext context, String route, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => context.go(route),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white70),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}