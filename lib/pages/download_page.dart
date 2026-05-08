import 'package:flutter/material.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/widgets/header.dart';
import 'package:pamoja_thrift2_web/widgets/footer.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            _buildHero(),
            _buildAppFeatures(),
            _buildStoreButtons(),
            _buildTestimonials(),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHero() {
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
                  'Get PamojaThrift App',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Download the app and start buying and selling second-hand items in Kenya. Available on both Android and iOS.',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.textLight,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    _buildStoreBadge(Icons.android, 'Android', 'Coming Soon'),
                    const SizedBox(width: 16),
                    _buildStoreBadge(Icons.apple, 'iOS', 'Coming Soon'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: Image.asset(
              'assets/logo/logo.png',
              height: 300,
              errorBuilder: (_, __, ___) => Container(
                height: 300,
                decoration: BoxDecoration(
                  color: AppTheme.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    Icons.phone_android,
                    size: 100,
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

  Widget _buildStoreBadge(IconData icon, String platform, String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: AppTheme.textDark),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                platform,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textDark,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppFeatures() {
    final features = [
      ('⚡', 'Lightning Fast', 'Browse and buy in seconds'),
      ('🔒', 'Secure Payments', 'M-Pesa & bank integration'),
      ('📱', 'Easy Listing', 'Sell in under 2 minutes'),
      ('💬', 'Instant Chat', 'Talk to buyers & sellers'),
    ];

    return Container(
      color: AppTheme.lightGreen,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          const Text(
            'App Features',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
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
              children: features.map((f) => _buildFeatureItem(f.$1, f.$2, f.$3)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String emoji, String title, String subtitle) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppTheme.textLight,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButtons() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Column(
        children: [
          const Text(
            'Ready to Get Started?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Choose your platform and download now.',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textLight,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStoreButton(
                'assets/Images/image 1.png',
                'Coming Soon to Google Play',
              ),
              const SizedBox(width: 24),
              _buildStoreButton(
                'assets/Images/image 2.png',
                'Coming Soon to App Store',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButton(String imagePath, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 40,
            width: 40,
            errorBuilder: (_, __, ___) => const Icon(Icons.shopping_bag, size: 40),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonials() {
    final testimonials = [
      ('"Great app! Found amazing deals on furniture for my new apartment."', '— Sarah M., Nairobi'),
      ('"Sold my old phone within hours. Super easy to use!"', '— John K., Mombasa'),
      ('"Love the M-Pesa integration. Very convenient for Kenyan users."', '— Grace W., Kisumu'),
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          const Text(
            'What Users Say',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: testimonials.map((t) => Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.format_quote,
                      color: AppTheme.primaryGreen,
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      t.$1,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppTheme.textDark,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      t.$2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}