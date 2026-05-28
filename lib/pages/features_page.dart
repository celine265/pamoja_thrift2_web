import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/widgets/page_container.dart';
import 'package:pamoja_thrift2_web/widgets/image_gallery.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildBuyerFeatures(),
            _buildSellerFeatures(),
            _buildImageGallery(),
            _buildCtaSection(context),
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
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
              letterSpacing: -0.5,
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

  Widget _buildBuyerFeatures() {
    final features = [
      ('Smart Search', Icons.search_rounded, 'Find exactly what you need with advanced filters by category, price, location, and condition.'),
      ('Secure Payments', Icons.verified_rounded, 'Pay safely using M-Pesa with buyer protection on every transaction.'),
      ('Order Tracking', Icons.track_changes_rounded, 'Track your deliveries in real-time from seller to your doorstep.'),
      ('Verified Reviews', Icons.star_rounded, 'Read authentic reviews from verified buyers to make informed decisions.'),
      ('In-App Chat', Icons.chat_rounded, 'Communicate directly with sellers through our secure messaging system.'),
      ('Buyer Protection', Icons.shield_rounded, 'Get refunds if items arrive damaged or not as described.'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          const Text(
            'For Buyers',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryGreen,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: features.map((f) => _buildFeatureCard(f.$1, f.$2, f.$3)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerFeatures() {
    final features = [
      ('Easy Listing', Icons.add_photo_alternate_rounded, 'Create listings in minutes with our simple upload process. Add photos, description, and pricing.'),
      ('Analytics Dashboard', Icons.analytics_rounded, 'Track views, likes, and sales with detailed analytics for your listings.'),
      ('Multiple Payments', Icons.payments_rounded, 'Receive payments via M-Pesa, bank transfer, or cash on delivery.'),
      ('Promote Listings', Icons.trending_up_rounded, 'Boost your items with paid promotions to reach more buyers.'),
      ('Quick Responses', Icons.notifications_active_rounded, 'Get notified instantly when buyers message you.'),
      ('Inventory Management', Icons.inventory_2_rounded, 'Organize and manage all your listings in one place.'),
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
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryOrange,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
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
      width: 340,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 24, color: AppTheme.primaryGreen),
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
            style: const TextStyle(
              color: AppTheme.textLight,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaSection(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Column(
        children: [
          const Text(
            'Start Your Journey Today',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 24),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ElevatedButton(
              onPressed: () => context.go('/download'),
              child: const Text('Download the App'),
            ),
          ),
        ],
      ),
    );
  }
}
