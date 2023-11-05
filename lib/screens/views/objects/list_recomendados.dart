import 'package:ekahanfirebase/screens/views/models/model_card.dart';
import 'package:ekahanfirebase/screens/views/models/text_with_configs.dart';
import 'package:flutter/material.dart';

class ListRecomendados extends StatefulWidget {
  const ListRecomendados({super.key});

  @override
  State<ListRecomendados> createState() => _ListRecomendadosState();
}

class _ListRecomendadosState extends State<ListRecomendados> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 10.0),
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          ModelCard(
            widthM: 325,
            btnPlus: true,
            textWidgets: [
              TextWithConfigs(
                text: 'Texto 1',
                fontSize: 11,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
