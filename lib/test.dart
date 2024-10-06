import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS Button Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modern SOS Button'),
        ),
        body: const Center(
          child: SOSButton(),
        ),
      ),
    );
  }
}

class SOSButton extends StatelessWidget {
  const SOSButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Define your SOS action here
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('SOS button pressed!')),
        );
      },
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(Colors.red), // Background color
        foregroundColor: WidgetStateProperty.all(Colors.white), // Text color
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
            horizontal: 40, vertical: 20)), // Padding
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded corners
          ),
        ),
        elevation: WidgetStateProperty.all(8), // Shadow effect
      ),
      child: const Text(
        'SOS',
        style: TextStyle(
          fontSize: 24, // Font size
          fontWeight: FontWeight.bold, // Font weight
        ),
      ),
    );
  }
}
