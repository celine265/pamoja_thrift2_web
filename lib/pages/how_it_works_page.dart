import 'package:flutter/material.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/widgets/header.dart';
import 'package:pamoja_thrift2_web/widgets/footer.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            _buildHeader(),
            _buildBuyerSteps(),
            _buildSellerSteps(),
            _buildFaqSection(),
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
            'How It Works',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Get started with PamojaThrift in minutes. Whether you\'re buying or selling, we\'ve made it simple.',
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
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryGreen,
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
                entry.key % 2 == 0,
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
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryOrange,
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
                entry.key % 2 == 1,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(String number, String title, String description, bool isLeft) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLeft) ...[
            _buildStepContent(number, title, description),
            const SizedBox(width: 24),
            _buildStepConnector(),
          ] else ...[
            _buildStepConnector(),
            const SizedBox(width: 24),
            _buildStepContent(number, title, description),
          ],
        ],
      ),
    );
  }

  Widget _buildStepContent(String number, String title, String description) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Step $number',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepConnector() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_forward,
        color: AppTheme.primaryGreen,
        size: 20,
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
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: const TextStyle(
              color: AppTheme.textLight,
            ),
          ),
        ],
      ),
    );
  }
}