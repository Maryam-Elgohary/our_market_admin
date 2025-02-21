import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/my_observer.dart';
import 'package:our_market_admin/features/auth/view/login_view.dart';
import 'package:our_market_admin/features/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyObserver();
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
        home: const LoginView());
  }
}
