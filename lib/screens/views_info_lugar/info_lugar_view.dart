import 'package:ekahanfirebase/Widgets/text_with_configs.dart';
import 'package:ekahanfirebase/services/firebase_service.dart';
import 'package:ekahanfirebase/services/ttservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';

class InfoLugarView extends StatefulWidget {
  const InfoLugarView({super.key});

  @override
  State<InfoLugarView> createState() => _InfoLugarViewState();
}

class _InfoLugarViewState extends State<InfoLugarView> {
  @override
  Widget build(BuildContext context) {
    final lugarID = ModalRoute.of(context)!.settings.arguments as String;
    Future<void>? audioFuture;
    return FutureBuilder<List>(
      future: getInfo(lugarID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Puedes mostrar un indicador de carga mientras se obtienen los datos
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text(
              'No se encontro el lugar.'); // Manejo cuando no hay datos
        } else {
          String msj = snapshot.data![1];
          String coords = snapshot.data![2];
          String px = snapshot.data![3];
          String py = snapshot.data![4];
          return Column(
            children: <Widget>[
              TextWithConfigs(
                text: snapshot.data![0],
                mt: 10,
                mb: 10,
                tmText: FontWeight.bold,
                fontSize: 25,
              ),
              TextWithConfigs(
                text: msj,
                mt: 10,
                mb: 10,
                nlines: 20,
                fontSize: 16,
              ),
              Row(
                children: <Widget>[
                  FilledButton(
                    onPressed: () async {
                      audioFuture = getAudio(msj);
                    },
                    child: FutureBuilder(
                      future: audioFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        return const Icon(Icons.play_circle);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  FilledButton(
                    onPressed: () async {
                      audioFuture = setPauseAudio();
                    },
                    child: FutureBuilder(
                      future: audioFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        return const Icon(Icons.pause);
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 500,
                height: 500,
                child: FlutterGoogleStreetView(
                  initPos: const LatLng(20.6829859, -88.5686491),
                  initSource: StreetViewSource.outdoor,
                  initBearing: 0.0, // Orientación inicial
                  initTilt: 0.0, // Inclinación inicial
                  initZoom: 1.0, // Zoom inicial
                  onStreetViewCreated: (controller) {
                    // Aquí puedes interactuar con el controlador de Street View
                  },
                ),
              ),
              SizedBox(height: 20, child: Text(coords)),
              SizedBox(height: 20, child: Text(px)),
              SizedBox(height: 20, child: Text(py)),
            ],
          );
        }
      },
    );
  }
}
