import 'package:flutter/material.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/widgets/page_container.dart';
import 'package:pamoja_thrift2_web/widgets/image_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

const String _apkDownloadUrl =
    'https://github.com/celine265/pamoja-thrift/releases/latest/download/app-release.apk';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHero(context),
            _buildAppFeatures(),
            _buildStoreButtons(context),
            _buildImageGallery(),
            _buildTestimonials(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      decoration: BoxDecoration(gradient: AppTheme.heroGradient),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: isMobile ? 48 : 80,
        ),
        child: isMobile
            ? _buildHeroMobile()
            : _buildHeroDesktop(),
      ),
    );
  }

  Widget _buildHeroDesktop() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Get PamojaThrift App',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Download the app and start buying and selling second-hand items in Kenya.',
                style: TextStyle(
                  fontSize: 18,
                  color: AppTheme.textLight,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 32),
              _buildDownloadRow(),
            ],
          ),
        ),
        const SizedBox(width: 48),
        Expanded(
          child: Image.asset(
            'assets/logo 5.png',
            height: 300,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Container(
              height: 300,
              decoration: BoxDecoration(
                color: AppTheme.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(
                  Icons.phone_android_rounded,
                  size: 100,
                  color: AppTheme.primaryGreen,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroMobile() {
    return Column(
      children: [
        const Text(
          'Get PamojaThrift App',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: AppTheme.textDark,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Download the app and start buying and selling second-hand items in Kenya. Available on both Android and iOS.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: AppTheme.textLight,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        _buildDownloadRow(),
        const SizedBox(height: 32),
        Image.asset(
          'assets/logo 5.png',
          height: 200,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.lightGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Icon(
                Icons.phone_android_rounded,
                size: 80,
                color: AppTheme.primaryGreen,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadRow() {
    return _buildApkDownloadButton();
  }

  Future<void> _launchApkDownload() async {
    final uri = Uri.parse(_apkDownloadUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildApkDownloadButton() {
    return GestureDetector(
      onTap: _launchApkDownload,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          gradient: AppTheme.accentGradient,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryOrange.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.android_rounded, size: 28, color: Colors.white),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Android',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Download APK',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
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

  Widget _buildAppFeatures() {
    final features = [
      ('Lightning Fast', Icons.flash_on_rounded, 'Browse and buy in seconds'),
      ('Secure Payments', Icons.lock_rounded, 'M-Pesa & bank integration'),
      ('Easy Listing', Icons.dashboard_rounded, 'Sell in under 2 minutes'),
      ('Instant Chat', Icons.forum_rounded, 'Talk to buyers & sellers'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          const Text(
            'App Features',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
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
              children: features.map((f) => _buildFeatureItem(f.$1, f.$2, f.$3)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String title, IconData icon, String subtitle) {
    return Container(
      width: 240,
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
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: AppTheme.primaryGreen),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 6),
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

  Widget _buildStoreButtons(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Column(
        children: [
          const Text(
            'Ready to Get Started?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
              letterSpacing: -0.2,
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
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildStoreButton(
                Icons.store_rounded,
                'Google Play',
                'Coming Soon',
                isMobile,
                false,
              ),
              GestureDetector(
                onTap: _launchApkDownload,
                child: _buildStoreButton(
                  Icons.android_rounded,
                  'Download APK',
                  'Direct APK Download',
                  isMobile,
                  true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButton(IconData icon, String title, String subtitle, bool isMobile, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 28,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: isActive ? null : Colors.white,
        gradient: isActive ? AppTheme.accentGradient : null,
        borderRadius: BorderRadius.circular(14),
        border: isActive ? null : Border.all(color: AppTheme.borderLight),
        boxShadow: isActive
            ? [BoxShadow(color: AppTheme.primaryOrange.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 6))]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32, color: isActive ? Colors.white : AppTheme.textDark),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isActive ? Colors.white : AppTheme.textDark,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: isActive ? Colors.white70 : AppTheme.textSubtle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonials(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    final testimonials = [
      ('"Great app! Found amazing deals on furniture for my new apartment."', '— Sarah M., Nairobi'),
      ('"Sold my old phone within hours. Super easy to use!"', '— John K., Mombasa'),
      ('"Love the M-Pesa integration. Very convenient for Kenyan users."', '— Grace W., Kisumu'),
    ];

    return Container(
      color: AppTheme.lightGreen,
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Text(
              'What Users Say',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppTheme.textDark,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 32),
            isMobile
                ? Column(
                    children: testimonials.map((t) => _buildTestimonialCard(t.$1, t.$2)).toList(),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: testimonials.map((t) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _buildTestimonialCard(t.$1, t.$2),
                      ),
                    )).toList(),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(String quote, String author) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.format_quote_rounded,
            color: AppTheme.primaryGreen,
            size: 36,
          ),
          const SizedBox(height: 12),
          Text(
            quote,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: AppTheme.textDark,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            author,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}
