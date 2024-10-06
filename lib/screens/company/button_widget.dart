import 'package:flutter/material.dart';
import 'package:s_o_s/screens/facility/facility.dart';
import 'package:s_o_s/screens/medical/medical.dart';
import 'package:s_o_s/screens/safety/saftety.dart';
import 'package:s_o_s/screens/securitye/security.dart';
import 'package:s_o_s/widget/button.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center buttons vertically
      children: [
        Buttons(
          text: 'Safety',
          backgroundColor: const Color.fromARGB(255, 110, 4, 4),
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
          text: 'Medical',
          backgroundColor: Colors.green.shade600,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const MedicalScreen();
              },
            ));
          },
        ),
        Buttons(
          text: 'Security',
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const SecurityScreen();
              },
            ));
          },
        ),
        Buttons(
          text: 'Facility',
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const FacilityScreen();
              },
            ));
          },
        ),
      ],
    );
  }
}
