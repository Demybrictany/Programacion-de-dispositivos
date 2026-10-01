import 'package:flutter/material.dart';

import 'home.dart';
import 'theme.dart';

class InkashApp extends StatelessWidget {
  const InkashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inkash',
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}
