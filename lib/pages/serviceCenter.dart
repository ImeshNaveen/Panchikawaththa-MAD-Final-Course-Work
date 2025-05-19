import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCentersPage extends StatefulWidget {
  @override
  _ServiceCentersPageState createState() => _ServiceCentersPageState();
}

class _ServiceCentersPageState extends State<ServiceCentersPage> {
  GoogleMapController? mapController;
  LocationData? currentLocation;
  final Location location = Location();
  String? error;

  final List<Map<String, dynamic>> serviceCenters = [
    {
      "name": "Auto Care Center",
      "lat": 6.9271,
      "lng": 79.8612,
      "description": "Top rated center for all vehicle repairs."
    },
    {
      "name": "Speed Motors",
      "lat": 6.9282,
      "lng": 79.8654,
      "description": "Oil change, tire replacement & more."
    },
  ];

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    try {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          setState(() {
            error = 'Location services are disabled.';
          });
          return;
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          setState(() {
            error = 'Location permission denied.';
          });
          return;
        }
      }

      final LocationData locationData = await location.getLocation();
      setState(() {
        currentLocation = locationData;
        error = null;
      });
    } catch (e) {
      setState(() {
        error = 'Error fetching location: $e';
      });
    }
  }

  Set<Marker> getMarkers() {
    return serviceCenters.map((center) {
      return Marker(
        markerId: MarkerId(center["name"]),
        position: LatLng(center["lat"], center["lng"]),
        infoWindow: InfoWindow(
          title: center["name"],
          snippet: center["description"],
          onTap: () => _openGoogleMaps(center["lat"], center["lng"]),
        ),
      );
    }).toSet();
  }

  void _openGoogleMaps(double lat, double lng) async {
    final Uri googleUrl = Uri.parse(
        "https://www.google.com/maps/dir/?api=1&destination=$lat,$lng");
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open Google Maps.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nearby Service Centers')),
      body: error != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning, color: Colors.red, size: 60),
                  SizedBox(height: 10),
                  Text(
                    error!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _checkLocationPermission,
                    child: Text('Retry'),
                  ),
                ],
              ),
            )
          : currentLocation == null
              ? Center(child: CircularProgressIndicator())
              : SizedBox.expand(
                  child: GoogleMap(
                    onMapCreated: (controller) {
                      mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                      zoom: 14.0,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: getMarkers(),
                  ),
                ),
    );
  }
}
