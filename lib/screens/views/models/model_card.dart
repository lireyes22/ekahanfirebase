import 'package:ekahanfirebase/screens/views/models/text_with_configs.dart';
import 'package:ekahanfirebase/screens/views/objects/image_lugar.dart';
import 'package:flutter/material.dart';

class ModelCard extends StatefulWidget {
  final double? widthM;
  final String urlImage;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  final bool btnPlus;
  final List<TextWithConfigs> textWidgets;
  const ModelCard(
      {super.key,
      this.widthM,
      this.btnPlus = false,
      required this.textWidgets,
      this.urlImage =
          'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/main/nodata.jpg',
      this.onTap,
      this.onPressed});

  @override
  State<ModelCard> createState() => _ModelCardState();
}

class _ModelCardState extends State<ModelCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        width: widget.widthM,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey[200]!),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                    maxHeight: 150,
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  child: ImageCard(
                    urlImage: widget.urlImage,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.textWidgets,
                ),
              ),
            ),
            //Si pone true, se agrega un boton visual (+)
            if (widget.btnPlus)
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                width: 45.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
/*
          const SizedBox(height: 4.0),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: 45.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ),
*/