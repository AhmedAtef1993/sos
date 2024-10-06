import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s_o_s/screens/home/notfication.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  String? _email, _password;

  // Method to show a snackbar
  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  Future<void> _signIn() async {
    try {
      // Attempt to sign in with email and password
      await _auth.signInWithEmailAndPassword(
          email: _email!, password: _password!);
      // Show success snackbar
      _showSnackbar('Login successful!', Colors.green);

      // Navigate to the next page after successful login
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LocationFirebaseScreen()), // Replace with your actual screen
      );
    } catch (e) {
      // Show error snackbar if login fails
      _showSnackbar(
          'Login failed: Incorrect username or password.', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _userNameController,
            onSaved: (value) {
              _email = value;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "User Name",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
          const SizedBox(height: 16),

          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
            onSaved: (value) {
              _password = value;
            },
            decoration: InputDecoration(
              hintText: "Password",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: Color(0xFF868686))
                    : const Icon(Icons.visibility, color: Color(0xFF868686)),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Forget Password
          GestureDetector(
            onTap: () {},
            child: Text(
              "Forget Password?",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 16),

          // Sign In Button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _signIn(); // Call sign-in method
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF22A45D),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Sign in"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
