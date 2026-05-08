import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/widgets/header.dart';
import 'package:pamoja_thrift2_web/widgets/footer.dart';
import 'package:pamoja_thrift2_web/widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            const HeroSection(
              title: 'Buy & Sell Second-Hand\nGoods in Kenya',
              subtitle: 'PamojaThrift is your trusted marketplace for quality pre-owned items. From fashion to electronics, find great deals or start selling today.',
            ),
            _buildStatsSection(),
            _buildFeaturesOverview(),
            _buildCtaSection(),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStat('10K+', 'Active Users'),
          _buildStat('50K+', 'Items Listed'),
          _buildStat('95%', 'Satisfaction'),
          _buildStat('24/7', 'Support'),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryGreen,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: AppTheme.textLight,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesOverview() {
    final features = [
      ('Secure Payments', Icons.verified_user, 'Safe transactions with M-Pesa integration'),
      ('Easy Listing', Icons.add_circle_outline, 'List your items in minutes'),
      ('Verified Users', Icons.people, 'Trusted community of buyers & sellers'),
      ('Fast Delivery', Icons.local_shipping, 'Reliable delivery across Kenya'),
    ];

    return Container(
      color: AppTheme.lightGreen,
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Column(
        children: [
          const Text(
            'Why Choose PamojaThrift?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
          const SizedBox(height: 16),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaSection() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ready to Start?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Join thousands of Kenyans buying and selling second-hand goods every day.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.textLight,
                  ),
                ),
                const SizedBox(height: 32),
                Builder(
                  builder: (ctx) => ElevatedButton(
                    onPressed: () => ctx.go('/download'),
                    child: const Text('Get Started Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}