import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_custom_app_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildCustomAppBar(context, "Login As An Admin", isBackButton: false),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(
              labelText: "Email",
              controller: emailController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomField(
              labelText: "Password",
              controller: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
