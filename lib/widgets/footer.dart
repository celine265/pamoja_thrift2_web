import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: AppTheme.darkGreen,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            if (isMobile)
              _buildMobileLayout(context)
            else
              _buildDesktopLayout(context),
            const SizedBox(height: 32),
            const Divider(color: Colors.white24),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\u00a9 2026 PamojaThrift. All rights reserved.',
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
                if (!isMobile)
                  Row(
                    children: [
                      _buildSocialIcon(Icons.facebook_rounded, 'Facebook'),
                      const SizedBox(width: 12),
                      _buildSocialIcon(Icons.camera_alt_rounded, 'Instagram'),
                      const SizedBox(width: 12),
                      _buildSocialIcon(Icons.alternate_email_rounded, 'Twitter'),
                      const SizedBox(width: 12),
                      _buildSocialIcon(Icons.chat_rounded, 'WhatsApp'),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildBrandColumn(),
        ),
        const SizedBox(width: 64),
        Expanded(
          child: _buildLinksColumn(context),
        ),
        Expanded(
          child: _buildContactColumn(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildBrandColumn(),
        const SizedBox(height: 32),
        _buildLinksColumn(context),
        const SizedBox(height: 32),
        _buildContactColumn(),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(Icons.facebook_rounded, 'Facebook'),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.camera_alt_rounded, 'Instagram'),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.alternate_email_rounded, 'Twitter'),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.chat_rounded, 'WhatsApp'),
          ],
        ),
      ],
    );
  }

  Widget _buildBrandColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/logo 5.png',
              height: 32,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.store,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'PamojaThrift',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          "Kenya's trusted marketplace for second-hand goods. Buy and sell sustainably with PamojaThrift.",
          style: TextStyle(
            color: Colors.white70,
            height: 1.7,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildLinksColumn(BuildContext context) {
    final links = [
      ('/', 'Home'),
      ('/features', 'Features'),
      ('/how-it-works', 'How It Works'),
      ('/download', 'Download'),
      ('/contact', 'Contact'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Links',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => _buildLink(context, link.$1, link.$2)),
      ],
    );
  }

  Widget _buildContactColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email_outlined, 'support@pamojathrift.com'),
        const SizedBox(height: 12),
        _buildContactItem(Icons.phone_outlined, '+254 700 000 000'),
        const SizedBox(height: 12),
        _buildContactItem(Icons.location_on_outlined, 'Nairobi, Kenya'),
      ],
    );
  }

  Widget _buildLink(BuildContext context, String route, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => context.go(route),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.white54),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: Colors.white70),
        ),
      ),
    );
  }
}
