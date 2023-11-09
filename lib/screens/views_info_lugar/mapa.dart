import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';

class MapaWidget extends StatefulWidget {
  final double latitude;
  final double longitude;
  const MapaWidget(
      {super.key, required this.latitude, required this.longitude});

  @override
  State<MapaWidget> createState() => _MapaWidgetState();
}

class _MapaWidgetState extends State<MapaWidget> {
  @override
  Widget build(BuildContext context) {
    try {
      return FlutterGoogleStreetView(
        initPos: LatLng(widget.latitude, widget.longitude),
        initSource: StreetViewSource.outdoor,
        initBearing: 0.0, // Orientación inicial
        initTilt: 0.0, // Inclinación inicial
        initZoom: 1.0, // Zoom inicial
        onStreetViewCreated: (controller) {
          // Aquí puedes interactuar con el controlador de Street View
        },
      );
    } catch (e) {
      return const Text("Hubo un error al cargar Street View");
    }
  }
}
