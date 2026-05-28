import 'package:flutter/material.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';

class ImageGallery extends StatelessWidget {
  final List<String> imagePaths;
  final String? title;
  final double imageHeight;

  const ImageGallery({
    super.key,
    required this.imagePaths,
    this.title,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppTheme.textDark,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 32),
          ],
          if (isMobile)
            _buildGridView()
          else
            _buildHorizontalList(),
        ],
      ),
    );
  }

  Widget _buildHorizontalList() {
    return SizedBox(
      height: imageHeight + 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        itemCount: imagePaths.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (ctx, index) => _buildImageCard(ctx, index, isHorizontal: true),
      ),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (ctx, index) => _buildImageCard(ctx, index, isHorizontal: false),
      ),
    );
  }

  Widget _buildImageCard(BuildContext ctx, int index, {required bool isHorizontal}) {
    return GestureDetector(
      onTap: () => _showLightbox(ctx, index),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          imagePaths[index],
          height: isHorizontal ? imageHeight : null,
          width: isHorizontal ? 280 : null,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: isHorizontal ? imageHeight : null,
            width: isHorizontal ? 280 : null,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, size: 40, color: AppTheme.textSubtle),
                SizedBox(height: 8),
                Text(
                  'Image not found',
                  style: TextStyle(color: AppTheme.textSubtle, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLightbox(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
                onPressed: () => Navigator.of(ctx).pop(),
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  height: 300,
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.white54, size: 64),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < imagePaths.length; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == index ? AppTheme.primaryGreen : Colors.white38,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
