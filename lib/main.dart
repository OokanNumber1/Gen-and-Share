import 'package:flutter/material.dart';
import 'package:gen_and_share/constants/theme.dart';
import 'package:gen_and_share/page/introduction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gen and Share',
      theme: AppTheme().getTheme(),
      home: const IntroductionPage(),
    );
  }
}
