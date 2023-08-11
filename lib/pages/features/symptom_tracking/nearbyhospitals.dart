import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyHospitalsPage extends StatelessWidget {
  const NearbyHospitalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Government Hospitals'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Initial map center
          zoom: 12.0, // Initial zoom level
        ),
        markers: {
          const Marker(
            markerId: MarkerId('marker_1'),
            position: LatLng(37.7749, -122.4194), // Marker position
            infoWindow: InfoWindow(title: 'Hospital A'), // Marker title
          ),
        },
      ),
    );
  }
}