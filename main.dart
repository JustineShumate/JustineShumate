import 'package:flutter/material.dart';
import 'featured_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Featured Page Demo',
      theme: ThemeData.dark(),
      home: FeaturedPage(),
    );
  }
}