import 'package:ekahanfirebase/Widgets/model_card.dart';
import 'package:ekahanfirebase/Widgets/text_with_configs.dart';
import 'package:ekahanfirebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ListPackages extends StatefulWidget {
  const ListPackages({super.key});

  @override
  State<ListPackages> createState() => _ListPackagesState();
}

class _ListPackagesState extends State<ListPackages> {
  @override
  Widget build(BuildContext context) {
    final lugarID = ModalRoute.of(context)!.settings.arguments as String;
    return FutureBuilder<List>(
      future: getPaquetes(lugarID),
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
            children: snapshot.data!.map((paquete) {
              // Accede a los campos de paquete directamente a través del mapa
              return ModelCard(
                urlImage: paquete['ArregloGaleria'][0],
                textWidgets: [
                  TextWithConfigs(
                    text: paquete['NombrePaquete'].toString(),
                    tmText: FontWeight.bold,
                    fontSize: 28,
                  ),
                  TextWithConfigs(
                    text:
                        '⭐ ${paquete['Puntuaciones']['ExperienciaGeneral'].toString()}',
                    fontSize: 15,
                  ),
                  TextWithConfigs(
                    text: paquete['Descripcion'].toString(),
                    fontSize: 12,
                    nlines: 3,
                  ),
                  TextWithConfigs(
                    text: paquete['Precio'].toString(),
                    fontSize: 16,
                    tmText: FontWeight.bold,
                    color: const Color.fromARGB(200, 0, 0, 0),
                  ),
                ],
                onTap: () {},
              );
            }).toList(),
          );
        }
      },
    );
  }
}
