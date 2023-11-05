import 'package:ekahanfirebase/screens/views/models/model_card.dart';
import 'package:ekahanfirebase/screens/views/models/text_with_configs.dart';
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
                    : 'https://i.ibb.co/4gZ6JMz/nodata.jpg',
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
                  Navigator.pushNamed(
                    context,
                    '/buildpack',
                    arguments: lugar.id, // lugar.id es el ID del documento
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
