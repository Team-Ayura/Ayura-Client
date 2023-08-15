import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';

class NearbyHospitalsPage extends StatelessWidget {
  const NearbyHospitalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Icons.arrow_back_outlined,
          Icons.lightbulb_outline_rounded,
          "Nearby Government Hospitals",
          leftCallback :()=>Navigator.of(context).pop()),
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