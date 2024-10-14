import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Safety"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: demoProducts.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => ProductCard(
              product: demoProducts[index],
              onPress: () {
                _showConfirmationDialog(context, demoProducts[index].title);
              },
            ),
          ),
        ),
      ),
    );
  }

  // Show the confirmation dialog, pass product title
  void _showConfirmationDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Are you sure you want to proceed?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                _showSnackBar(context, 'Your request has been sent');

                // Call to send the current location and get latitude and longitude
                try {
                  Position position =
                      await _sendCurrentLocation(context, title);
                } catch (e) {
                  _showSnackBar(
                      context, 'Failed to send location: ${e.toString()}');
                }
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  // Show the Snackbar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Send the current location after getting permission and save to Firebase with title
  Future<Position> _sendCurrentLocation(
      BuildContext context, String title) async {
    // Check permissions first
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Get the current position
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Generate Google Maps link
      String locationLink =
          "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";

      // Send location and title to Firestore
      await FirebaseFirestore.instance.collection('locations').add({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'service': title, // Include the product title (service name)
        'timestamp': FieldValue.serverTimestamp(), // Save with server timestamp
      });

      _showSnackBar(context,
          'Location sent successfully! $locationLink'); // Show the location link in Snackbar

      // Return position for use in sending email
      return position; // Return the Position object
    } else {
      _showSnackBar(context, 'Location permission denied!');
      throw Exception('Location permission denied!');
    }
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  });

  final double width, aspectRetio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(product.images),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: const TextStyle(
                  fontFamily: 'GothamBook', fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: onPress, // Trigger the confirmation dialog here
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String title;
  final String images;

  Product({
    required this.images,
    required this.title,
  });
}

List<Product> demoProducts = [
  Product(
    images: "assets/image/firefighter.png",
    title: "Firefighter",
  ),
  Product(
    images: "assets/image/escort_car.png",
    title: "Escort Service",
  ),
];
