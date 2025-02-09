import 'package:flutter/material.dart';
import 'package:our_market_admin/features/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Our Market Admin',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomeView());
  }
}
