import 'package:ekahanfirebase/Widgets/model_card.dart';
import 'package:ekahanfirebase/Widgets/text_with_configs.dart';
import 'package:ekahanfirebase/screens/views_info_lugar/img_air_quality.dart';
import 'package:ekahanfirebase/screens/views_info_lugar/mapa.dart';
import 'package:ekahanfirebase/services/firebase_service.dart';
import 'package:ekahanfirebase/services/ttservice.dart';
import 'package:flutter/material.dart';

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
          return Column(children: <Widget>[
            const CircularProgressIndicator(),
            FilledButton(
              onPressed: () async {
                setState(() {});
              },
              child: const Icon(Icons.replay),
            ),
          ]); // Puedes mostrar un indicador de carga mientras se obtienen los datos
        } else if (snapshot.hasError) {
          return FilledButton(
            onPressed: () async {
              setState(() {});
            },
            child: const Icon(Icons.replay),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text(
              'No se encontro el lugar.'); // Manejo cuando no hay datos
        } else {
          String msj = snapshot.data![1];
          String emblematico = snapshot.data![2];
          double latitude = snapshot.data![3];
          double longitude = snapshot.data![4];
          String airCategory = snapshot.data![5];
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
                  ),
                  const SizedBox(width: 10),
                  FilledButton(
                    onPressed: () async {
                      setState(() {});
                    },
                    child: const Icon(Icons.replay),
                  )
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 500,
                height: 500,
                child: MapaWidget(latitude: latitude, longitude: longitude),
              ),
              ModelCard(
                urlImage: urlmage(airCategory),
                textWidgets: <TextWithConfigs>[
                  TextWithConfigs(
                      fontSize: 15,
                      tmText: FontWeight.bold,
                      text:
                          '${latitude.toString()} °N, ${longitude.toString()} °W'),
                  TextWithConfigs(
                    text: emblematico,
                    fontSize: 13,
                    nlines: 5,
                  ),
                  TextWithConfigs(
                    text: airCategory,
                    fontSize: 13,
                    nlines: 5,
                    tmText: FontWeight.bold,
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
