import 'package:flutter/material.dart';
import 'package:pamoja_thrift2_web/theme/app_theme.dart';
import 'package:pamoja_thrift2_web/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PamojaThrift - Buy & Sell Second-Hand in Kenya',
      theme: AppTheme.theme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}