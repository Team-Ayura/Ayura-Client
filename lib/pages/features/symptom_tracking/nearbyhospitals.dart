import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';

class NearbyHospitalsPage extends StatelessWidget {
  const NearbyHospitalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of markers representing hospitals
    final List<Marker> hospitals = [
      const Marker(
        markerId: MarkerId('hospital_1'),
        position: LatLng(6.55, 79.52), // Hospital A coordinates
        infoWindow: InfoWindow(
          title: 'Hospital A',
          snippet: 'Coordinates: 6°55\'09" N, 79°52\'05" E',
        ),
      ),
      // const Marker(
      //   markerId: MarkerId('hospital_2'),
      //   position: LatLng(37.7816, -122.4300), // Hospital B coordinates
      //   infoWindow: InfoWindow(title: 'Hospital B'), // Marker title
      // ),
      // Add more markers for other hospitals
    ];
    return Scaffold(
      appBar: CustomAppBar(
          Icons.arrow_back_outlined,
          Icons.lightbulb_outline_rounded,
          "Nearby Government Hospitals",
          leftCallback :()=>Navigator.of(context).pop()),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(6.9, 80.1), // Initial map center
          zoom: 10, // Initial zoom level
        ),
        markers: Set<Marker>.from(hospitals),
      ),
    );
  }
}