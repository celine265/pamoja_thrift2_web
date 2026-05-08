import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/widgets/header.dart';
import 'package:pamoja_thrift2_web/widgets/footer.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            _buildHeader(),
            _buildBuyerFeatures(),
            _buildSellerFeatures(),
            _buildCtaSection(),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: const Column(
        children: [
          Text(
            'Powerful Features for Everyone',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Everything you need to buy and sell second-hand items efficiently in Kenya.',
            style: TextStyle(
              fontSize: 18,
              color: AppTheme.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBuyerFeatures() {
    final features = [
      ('🔍', 'Smart Search', 'Find exactly what you need with advanced filters by category, price, location, and condition.'),
      ('💳', 'Secure Payments', 'Pay safely using M-Pesa with buyer protection on every transaction.'),
      ('📦', 'Order Tracking', 'Track your deliveries in real-time from seller to your doorstep.'),
      ('⭐', 'Verified Reviews', 'Read authentic reviews from verified buyers to make informed decisions.'),
      ('💬', 'In-App Chat', 'Communicate directly with sellers through our secure messaging system.'),
      ('🛡️', 'Buyer Protection', 'Get refunds if items arrive damaged or not as described.'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          const Text(
            'For Buyers',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryGreen,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children: features.map((f) => _buildFeatureCard(f.$1, f.$2, f.$3)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerFeatures() {
    final features = [
      ('📸', 'Easy Listing', 'Create listings in minutes with our simple upload process. Add photos, description, and pricing.'),
      ('📊', 'Analytics Dashboard', 'Track views, likes, and sales with detailed analytics for your listings.'),
      ('💰', 'Multiple Payment Options', 'Receive payments via M-Pesa, bank transfer, or cash on delivery.'),
      ('🚀', 'Promote Listings', 'Boost your items with paid promotions to reach more buyers.'),
      ('📱', 'Quick Responses', 'Get notified instantly when buyers message you.'),
      ('🏷️', 'Inventory Management', 'Organize and manage all your listings in one place.'),
    ];

    return Container(
      color: AppTheme.lightGreen,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          const Text(
            'For Sellers',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryOrange,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children: features.map((f) => _buildFeatureCard(f.$1, f.$2, f.$3)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String emoji, String title, String description) {
    return Container(
      width: 340,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 12),
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
            style: const TextStyle(
              color: AppTheme.textLight,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaSection() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Column(
        children: [
          const Text(
            'Start Your Journey Today',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 24),
          Builder(
            builder: (ctx) => ElevatedButton(
              onPressed: () => ctx.go('/download'),
              child: const Text('Download the App'),
            ),
          ),
        ],
      ),
    );
  }
}