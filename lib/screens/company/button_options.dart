import 'package:flutter/material.dart';
import 'package:s_o_s/screens/safety/saftety.dart';
import 'package:s_o_s/widget/button.dart';

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
          children: [
            Buttons(
              text: 'Safety',
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SafetyScreen();
                  },
                ));
              },
            ),
            Buttons(
              text: 'Safety',
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SafetyScreen();
                  },
                ));
              },
            ),
            Buttons(
              text: 'Safety',
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SafetyScreen();
                  },
                ));
              },
            ),
            Buttons(
              text: 'Safety',
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SafetyScreen();
                  },
                ));
              },
            ),
          ],
        );
      },
    );
  }
}
