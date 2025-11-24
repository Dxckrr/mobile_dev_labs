import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'gps_service.dart';

class GPSPage extends StatefulWidget {
  const GPSPage({super.key});

  @override
  State<GPSPage> createState() => _GPSPageState();
}

class _GPSPageState extends State<GPSPage> {
  final GpsService _gpsService = GpsService();

  Position? _actualLocation;
  String? _error;

  Future<void> _getLocation() async {
    setState(() {
      _error = null;
      _actualLocation = null;
    });

    try {
      final position = await _gpsService.obtenerGps();
      setState(() {
        _actualLocation = position;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  Future<void> _openInMaps() async {
    if (_actualLocation == null) return;

    final lat = _actualLocation!.latitude;
    final lng = _actualLocation!.longitude;

    final url = "http://www.google.com/maps/place/$lat,$lng";

    try {
      await _gpsService.abrirUrl(url);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GPS App")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on, size: 80, color: Colors.blue),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _getLocation,
                child: const Text("Get Location"),
              ),

              const SizedBox(height: 20),

              if (_error != null)
                Text(
                  _error!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),

              if (_actualLocation != null) ...[
                Text("Latitud: ${_actualLocation!.latitude}"),
                Text("Longitud: ${_actualLocation!.longitude}"),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _openInMaps,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Open in Google Maps"),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
