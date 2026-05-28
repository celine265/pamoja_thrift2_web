import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pamoja_thrift2_web/widgets/header.dart';
import 'package:pamoja_thrift2_web/widgets/footer.dart';

class PageContainer extends StatelessWidget {
  final Widget child;

  const PageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    return Scaffold(
      endDrawer: MobileDrawer(currentRoute: currentRoute),
      body: Column(
        children: [
          const AppHeader(),
          Expanded(child: child),
          const AppFooter(),
        ],
      ),
    );
  }
}

class ContentWrapper extends StatelessWidget {
  final Widget child;

  const ContentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: child,
    );
  }
}
