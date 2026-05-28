import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

const String _apkDownloadUrl =
    'https://github.com/celine265/pamoja-thrift/releases/latest/download/app-release.apk';

Future<void> _launchApkDownload() async {
  final uri = Uri.parse(_apkDownloadUrl);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  final _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        final scrolled = _scrollController.offset > 20;
        if (scrolled != _isScrolled) {
          setState(() => _isScrolled = scrolled);
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: _isScrolled
            ? [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 4))]
            : null,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.go('/'),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo 5.png',
                    height: 36,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.store,
                      size: 36,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'PamojaThrift',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryGreen,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (isMobile)
              _buildMobileMenu(context)
            else
              _buildDesktopNav(context, currentRoute),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopNav(BuildContext context, String currentRoute) {
    final links = [
      ('/', 'Home'),
      ('/features', 'Features'),
      ('/how-it-works', 'How It Works'),
      ('/contact', 'Contact'),
    ];

    return Row(
      children: [
        ...links.map((link) {
          final isActive = currentRoute == link.$1;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: TextButton(
                onPressed: () => context.go(link.$1),
                style: TextButton.styleFrom(
                  foregroundColor: isActive ? AppTheme.primaryGreen : AppTheme.textDark,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      link.$2,
                      style: TextStyle(
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 2,
                      width: isActive ? 20 : 0,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        const SizedBox(width: 16),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ElevatedButton(
            onPressed: _launchApkDownload,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.download_rounded, size: 18),
                SizedBox(width: 8),
                Text('Download Apk'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ElevatedButton(
            onPressed: _launchApkDownload,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              minimumSize: Size.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.download_rounded, size: 20),
                SizedBox(width: 6),
                Text('Apk', style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Builder(
          builder: (ctx) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: IconButton(
              icon: const Icon(Icons.menu_rounded, color: AppTheme.textDark),
              onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            ),
          ),
        ),
      ],
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final String currentRoute;

  const MobileDrawer({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final links = [
      ('/', 'Home', Icons.home_rounded),
      ('/features', 'Features', Icons.stars_rounded),
      ('/how-it-works', 'How It Works', Icons.help_outline_rounded),
      ('/contact', 'Contact', Icons.mail_outline_rounded),
    ];

    return Drawer(
      width: 280,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/logo 5.png',
                        height: 36,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.store,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'PamojaThrift',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Kenya\'s thrift marketplace',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: links.map((link) {
                  final isActive = currentRoute == link.$1;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: isActive ? AppTheme.primaryGreen.withOpacity(0.08) : null,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        link.$3,
                        color: isActive ? AppTheme.primaryGreen : AppTheme.textLight,
                        size: 22,
                      ),
                      title: Text(
                        link.$2,
                        style: TextStyle(
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                          color: isActive ? AppTheme.primaryGreen : AppTheme.textDark,
                        ),
                      ),
                      selected: isActive,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        context.go(link.$1);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _launchApkDownload();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryOrange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.download_rounded, size: 20),
                    SizedBox(width: 8),
                    Text('Download Apk'),
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
