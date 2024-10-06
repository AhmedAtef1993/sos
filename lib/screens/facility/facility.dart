import 'package:flutter/material.dart';

class FacilityScreen extends StatelessWidget {
  const FacilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Facility"),
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
                _showConfirmationDialog(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Your request has been sent!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Are you sure you want to proceed?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(context);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
              style: TextStyle(fontSize: 20),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: onPress, // Modified here
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
    images: "assets/image/carpenter.png",
    title: "Carpenter",
  ),
  Product(
    images: "assets/image/electrician.png",
    title: "Electrician",
  ),
  Product(
    images: "assets/image/plumber.png",
    title: "Plumber",
  ),
  Product(
    images: "assets/image/driver.png",
    title: "Executive Driver",
  ),
];
