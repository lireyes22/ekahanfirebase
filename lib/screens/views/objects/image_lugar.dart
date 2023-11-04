import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class ImageCard extends StatelessWidget {
  final String urlImage;
  const ImageCard({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    try {
      return Image.network(
        urlImage,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    } catch (e) {
      logger.e('Error al cargar la imagen: ${e.toString()}');
      return Image.asset('assets/images/nodata.jpg');
    }
  }
}
