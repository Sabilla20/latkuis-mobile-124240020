import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() => runApp(const GacoanApp());

class GacoanApp extends StatelessWidget {
  const GacoanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Gacoan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
