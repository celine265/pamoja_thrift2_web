import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showButtons;
  final String? imagePath;

  const HeroSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.showButtons = true,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.heroGradient,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 48 : 80,
        ),
        child: isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark,
                  height: 1.1,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppTheme.textLight,
                  height: 1.7,
                ),
              ),
              if (showButtons) ...[
                const SizedBox(height: 40),
                _buildButtons(context),
                const SizedBox(height: 32),
                _buildTrustBadges(),
              ],
            ],
          ),
        ),
        const SizedBox(width: 64),
        Expanded(
          flex: 4,
          child: _buildHeroImage(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: AppTheme.textDark,
            height: 1.15,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: AppTheme.textLight,
            height: 1.6,
          ),
        ),
        if (showButtons) ...[
          const SizedBox(height: 32),
          _buildButtons(context),
          const SizedBox(height: 28),
          _buildTrustBadges(),
        ],
        const SizedBox(height: 40),
        _buildHeroImage(),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ElevatedButton(
            onPressed: () => context.go('/download'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryOrange,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.download_rounded, size: 20),
                SizedBox(width: 10),
                Text('Download App'),
              ],
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: OutlinedButton(
            onPressed: () => context.go('/how-it-works'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_circle_outline_rounded, size: 20),
                SizedBox(width: 10),
                Text('Learn More'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrustBadges() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _badge(Icons.people_rounded, '10K+ Users'),
        Container(width: 1, height: 24, color: AppTheme.borderLight),
        _badge(Icons.map_rounded, '47 Counties'),
        Container(width: 1, height: 24, color: AppTheme.borderLight),
        _badge(Icons.verified_rounded, 'Safe Payments'),
      ],
    );
  }

  Widget _badge(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppTheme.primaryGreen),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppTheme.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageHeight = constraints.maxWidth > 400 ? 300.0 : 220.0;
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath ?? 'assets/logo 5.png',
            height: imageHeight,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Container(
              height: imageHeight,
              decoration: BoxDecoration(
                color: AppTheme.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(
                  Icons.store,
                  size: 100,
                  color: AppTheme.primaryGreen,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
