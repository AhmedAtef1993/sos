import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Set specific width and height for the buttons
        final double buttonWidth =
            constraints.maxWidth * 0.9; // 80% of screen width
        const double buttonHeight = 90; // Fixed height of 100 pixels

        return Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center buttons vertically
          children: <Widget>[
            // Button 1
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  print('Button 1 Pressed');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ButtonWidget(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Button color
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ), // Text style
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: const Text('Safety'),
              ),
            ),
            const SizedBox(height: 15), // Space between buttons

            // Button 2
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  print('Button 2 Pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green, // Button color
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: const Text('Medical'),
              ),
            ),
            const SizedBox(height: 15), // Space between buttons

            // Button 3
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  print('Button 3 Pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.orange, // Button color
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: const Text('Services'),
              ),
            ),
            const SizedBox(height: 15), // Space between buttons

            // Button 4
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  print('Button 4 Pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red, // Button color
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: const Text('Facility'),
              ),
            ),
          ],
        );
      },
    );
  }
}
