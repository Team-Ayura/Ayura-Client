import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapContainer extends StatefulWidget {
  final bool isRegular;
  final double latitude;
  final double longitude;
  final String markerTitle;

  MapContainer({
    required this.isRegular,
    required this.latitude,
    required this.longitude,
    required this.markerTitle,
  });
  @override
  _MapContainerState createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.isRegular ? MediaQuery.of(context).size.width - 40 : 80,
        height: widget.isRegular ? MediaQuery.of(context).size.width - 40 : 80,
        decoration: widget.isRegular
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              )
            : null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  widget.latitude,
                  widget
                      .longitude), // Replace with your desired initial center coordinates
              zoom: 17.0, // You can adjust the initial zoom level here
            ),
            mapType: MapType.normal,
            // Hide the Google logo, location name, and legal attribution
            mapToolbarEnabled: false,
            liteModeEnabled: true, // This also hides location names
            markers: {
              Marker(
                markerId: const MarkerId('marker_id'),
                position: LatLng(widget.latitude,
                    widget.longitude), // Replace with the marker position
                infoWindow:
                    InfoWindow(title: widget.markerTitle, snippet: null),
              ),
            },
          ),
        ),
      ),
    );
  }
}
