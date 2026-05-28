import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/widgets/hero_section.dart';
import 'package:pamoja_thrift2_web/widgets/page_container.dart';
import 'package:pamoja_thrift2_web/widgets/image_gallery.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(
              title: 'Buy & Sell Second-Hand\nGoods in Kenya',
              subtitle: 'PamojaThrift is your trusted marketplace for quality pre-owned items. From fashion to electronics, find great deals or start selling today.',
            ),
            _buildFeaturesOverview(),
            _buildImageGallery(),
            _buildCtaSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGallery() {
    final images = [
      'assets/Images/Screenshot 2026-05-28 101257.png',
      'assets/Images/Screenshot 2026-05-28 101321.png',
      'assets/Images/Screenshot 2026-05-28 101518.png',
      'assets/app promo/promo photo.png',
    ];

    return Container(
      color: AppTheme.lightGreen,
      child: ImageGallery(imagePaths: images),
    );
  }

  Widget _buildFeaturesOverview() {
    final features = [
      ('Secure Payments', Icons.verified_user_rounded, 'Safe transactions with M-Pesa integration'),
      ('Easy Listing', Icons.add_circle_outline_rounded, 'List your items in minutes'),
      ('Verified Users', Icons.people_rounded, 'Trusted community of buyers & sellers'),
      ('Fast Delivery', Icons.local_shipping_rounded, 'Reliable delivery across Kenya'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Column(
        children: [
          const Text(
            'Why Choose PamojaThrift?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 48),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: features.map((f) => _buildFeatureCard(f.$1, f.$2, f.$3)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, IconData icon, String description) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: AppTheme.primaryGreen),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.textLight,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      decoration: const BoxDecoration(gradient: AppTheme.ctaGradient),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Column(
          children: [
            Text(
              'Ready to Start?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Join thousands of Kenyans buying and selling second-hand goods every day.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: Colors.white.withOpacity(0.85),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 36),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ElevatedButton(
                onPressed: () => context.go('/download'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.darkGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.download_rounded, size: 20),
                    SizedBox(width: 10),
                    Text('Get Started Now'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
