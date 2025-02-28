import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'presentation/screens/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profiles App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: ProfileScreen(),
    );
  }
}
