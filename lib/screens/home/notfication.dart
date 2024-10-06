import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:s_o_s/screens/company/services.dart';

class LocationFirebaseScreen extends StatefulWidget {
  const LocationFirebaseScreen({super.key});

  @override
  _LocationFirebaseScreenState createState() => _LocationFirebaseScreenState();
}

class _LocationFirebaseScreenState extends State<LocationFirebaseScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Color _buttonColor =
      const Color.fromARGB(255, 244, 54, 54); // Initial color

  // Future<void> _getLocationAndUpload() async {
  //   LocationPermission permission = await Geolocator.requestPermission();

  //   if (permission != LocationPermission.denied &&
  //       permission != LocationPermission.deniedForever) {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //     await _uploadLocationToFirebase(position);
  //   } else {
  //     // Handle permission denied scenario
  //     print("Location permission denied.");
  //   }
  // }

  // Future<void> _uploadLocationToFirebase(Position position) async {
  //   try {
  //     await _firestore.collection('locations').add({
  //       'latitude': position.latitude,
  //       'longitude': position.longitude,
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });
  //     print("Location uploaded: ${position.latitude}, ${position.longitude}");
  //   } catch (e) {
  //     print("Failed to upload location: $e");
  //   }
  // }

  // void _changeButtonColor() {
  //   setState(() {
  //     _buttonColor =
  //         const Color.fromARGB(255, 138, 4, 4); // Change color to yellow
  //   });

  //   // Reset color back to red after 10 seconds
  //   Future.delayed(const Duration(seconds: 10), () {
  //     setState(() {
  //       _buttonColor =
  //           const Color.fromARGB(255, 1, 153, 3); // Reset to original color
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(_buttonColor), // Use the state color
            foregroundColor:
                WidgetStateProperty.all(Colors.white), // Text color
            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
                horizontal: 90, vertical: 105)), // Padding
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(210), // Rounded corners
              ),
            ),
            elevation: WidgetStateProperty.all(8), // Shadow effect
          ),
          onPressed: () {}, // Change color on press
          onLongPress: () {
            // _changeButtonColor();
            // _getLocationAndUpload();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ButtonWidget(),
              ),
            );
          },
          child: const Text(
            'SOS',
            style: TextStyle(
              fontSize: 70, // Font size
              fontWeight: FontWeight.bold, // Font weight
            ),
          ),
        ),
      ),
    );
  }
}
