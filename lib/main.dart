import 'package:flutter/material.dart';
import 'package:project/screens/onboarding_screen.dart';
import 'package:project/utils/1clx_theme.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1CLX',
      theme: appTheme,
      home: const OnboardingScreen(),
    );
  }
}
