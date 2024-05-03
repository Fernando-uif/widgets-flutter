import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 1).getTheme(),
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardScreen()
      // },
    );
  }
}
