import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_custom_app_bar.dart';

class AddAdminView extends StatefulWidget {
  const AddAdminView({super.key});

  @override
  State<AddAdminView> createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Add Admin"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomField(
                labelText: "Email",
                controller: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                labelText: "Password",
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(child: const Text("Add"), onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
