import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LocationNotificationPage extends StatefulWidget {
  @override
  _LocationNotificationPageState createState() =>
      _LocationNotificationPageState();
}

class _LocationNotificationPageState extends State<LocationNotificationPage> {
  GoogleMapController? _mapController;
  LatLng _currentPosition = const LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> _sendNotification() async {
    // Send notification to Firebase Firestore (Cloud Function can trigger based on location)
    FirebaseFirestore.instance.collection('notifications').add({
      'location':
          GeoPoint(_currentPosition.latitude, _currentPosition.longitude),
      'timestamp': DateTime.now(),
    });

    // Use Firebase Cloud Messaging to send the actual notification
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.subscribeToTopic('location_updates');
    print("Notification sent!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Location Notification'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 15,
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _sendNotification,
              child: const Text('Send Notification with Location'),
            ),
          ),
        ],
      ),
    );
  }
}
