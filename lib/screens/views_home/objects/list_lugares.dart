import 'package:ekahanfirebase/Widgets/model_card.dart';
import 'package:ekahanfirebase/Widgets/text_with_configs.dart';
import 'package:ekahanfirebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ListLugares extends StatefulWidget {
  const ListLugares({super.key});

  @override
  State<ListLugares> createState() => _ListLugaresState();
}

class _ListLugaresState extends State<ListLugares> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getLugares(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Puedes mostrar un indicador de carga mientras se obtienen los datos
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text(
              'No se encontraron lugares.'); // Manejo cuando no hay datos
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: snapshot.data!.map((lugar) {
              // Accede a los campos de lugar directamente a través del mapa
              return ModelCard(
                urlImage: lugar['imgRepresentativa'] != null &&
                        lugar['imgRepresentativa'].isNotEmpty
                    ? lugar['imgRepresentativa'].toString()
                    : 'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/main/nodata.jpg',
                textWidgets: [
                  TextWithConfigs(
                    text: lugar['lugar'].toString(),
                    tmText: FontWeight.bold,
                    fontSize: 28,
                  ),
                  TextWithConfigs(
                    text:
                        '⭐ ${lugar['calificacion'].toString()} (${lugar['votos']}+)',
                    fontSize: 15,
                  ),
                  TextWithConfigs(
                    text: lugar['descripcion'].toString(),
                    fontSize: 12,
                    nlines: 3,
                  ),
                  TextWithConfigs(
                    text: lugar['destacado'].toString(),
                    fontSize: 16,
                    tmText: FontWeight.bold,
                    color: const Color.fromARGB(200, 0, 0, 0),
                  ),
                ],
                onTap: () {
                  String lugarID = lugar['id']; // Acceder al ID del documento
                  Navigator.pushNamed(
                    context,
                    '/pack',
                    arguments: lugarID,
                  );
                },
                btnPlus: true,
                icono: const Icon(Icons.view_comfy, color: Colors.white),
                onPressed: () {
                  String lugarID = lugar['id']; // Acceder al ID del documento
                  Navigator.pushNamed(
                    context,
                    '/infolugar',
                    arguments: lugarID,
                  );
                },
              );
            }).toList(),
          );
        }
      },
    );
  }
}
