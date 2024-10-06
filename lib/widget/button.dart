import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons(
      {super.key,
      this.onPressed,
      required this.text,
      required this.foregroundColor,
      required this.backgroundColor});
  final void Function()? onPressed;
  final String text;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 5,
        height: 90,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor, // Button color
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ), // Text style
            padding: const EdgeInsets.symmetric(vertical: 20.0), // Padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
