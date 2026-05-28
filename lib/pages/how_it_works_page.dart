import 'package:flutter/material.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/widgets/page_container.dart';
import 'package:pamoja_thrift2_web/widgets/image_gallery.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildBuyerSteps(),
            _buildSellerSteps(),
            _buildImageGallery(),
            _buildFaqSection(),
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
            'How It Works',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Get started with PamojaThrift in minutes. Whether you're buying or selling, we've made it simple.",
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

  Widget _buildBuyerSteps() {
    final steps = [
      ('1', 'Download & Sign Up', 'Get the app from your preferred store and create your account.'),
      ('2', 'Browse & Search', 'Explore thousands of items or use filters to find exactly what you need.'),
      ('3', 'Contact Seller', 'Chat with sellers to ask questions or negotiate prices.'),
      ('4', 'Make Payment', 'Pay securely through M-Pesa or other available payment methods.'),
      ('5', 'Receive Item', 'Track your delivery and receive your item. Leave a review!'),
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
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: steps.asMap().entries.map((entry) => _buildStepCard(
                entry.value.$1,
                entry.value.$2,
                entry.value.$3,
                entry.key,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerSteps() {
    final steps = [
      ('1', 'Create Account', 'Sign up and verify your phone number to start selling.'),
      ('2', 'List Your Item', 'Take photos, add description, set your price, and publish.'),
      ('3', 'Connect with Buyers', 'Receive messages from interested buyers and negotiate.'),
      ('4', 'Confirm & Ship', 'Agree on terms, receive payment, and ship the item.'),
      ('5', 'Get Paid', 'Receive payment directly to your M-Pesa or bank account.'),
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
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: steps.asMap().entries.map((entry) => _buildStepCard(
                entry.value.$1,
                entry.value.$2,
                entry.value.$3,
                entry.key,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(String number, String title, String description, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
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
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  number,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(
                      color: AppTheme.textLight,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqSection() {
    final faqs = [
      ('Is it free to list items?', 'Yes! Listing items on PamojaThrift is completely free. We only charge a small fee when your item sells.'),
      ('How do I get paid?', 'Payments are processed directly to your M-Pesa account or bank account within 24 hours of confirming a sale.'),
      ('What if something goes wrong?', 'Our buyer protection policy ensures you\'re covered. Contact our support team and we\'ll help resolve any issues.'),
      ('Can I sell from anywhere in Kenya?', 'Absolutely! PamojaThrift is available across all 47 counties in Kenya.'),
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Column(
        children: [
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 32),
          ...faqs.map((faq) => _buildFaqItem(faq.$1, faq.$2)),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.help_outline_rounded, size: 20, color: AppTheme.primaryGreen),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              answer,
              style: const TextStyle(
                color: AppTheme.textLight,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
