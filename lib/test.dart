import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class homme extends StatefulWidget {
  const homme({super.key});

  @override
  State<homme> createState() => _hommeState();
}

class _hommeState extends State<homme> {
  @override
  Widget build(BuildContext context) {
    return   GoogleMap( initialCameraPosition: CameraPosition(target:  LatLng(2555, 0)),);
  }
}