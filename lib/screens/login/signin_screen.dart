import 'package:flutter/material.dart';
import 'package:s_o_s/screens/login/login_page.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: const SignInForm(),
    );
  }
}
