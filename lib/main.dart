import 'package:ccd2023/screens/login/login.dart';
import 'package:ccd2023/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CCDApp());
}

class CCDApp extends StatelessWidget {
  const CCDApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CCD 2023',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,

      /// TODO: Configure Auto Router

      home: const LoginScreen(),
    );
  }
}
