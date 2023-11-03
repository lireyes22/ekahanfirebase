import 'package:ekahanfirebase/screens/views/models/text_with_configs.dart';
import 'package:flutter/material.dart';

class ModelCard extends StatefulWidget {
  final double? widthM;
  final List<TextWithConfigs> textWidgets;
  const ModelCard({super.key, this.widthM, required this.textWidgets});

  @override
  State<ModelCard> createState() => _ModelCardState();
}

class _ModelCardState extends State<ModelCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  child: const Text('Img del lugar',
                      style: TextStyle(color: Colors.white)),
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
            )
          ],
        ),
      ),
    );
  }
}
