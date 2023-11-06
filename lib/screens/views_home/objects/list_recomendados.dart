import 'package:ekahanfirebase/providers/provider_prueba.dart';
import 'package:ekahanfirebase/Widgets/model_card.dart';
import 'package:ekahanfirebase/Widgets/text_with_configs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        children: <Widget>[
          ModelCard(
            widthM: 325,
            btnPlus: true,
            textWidgets: [
              TextWithConfigs(
                text: context.watch<ProviderPrueba>().pr,
                fontSize: 11,
              ),
            ],
            onPressed: () {
              setState(() {
                context.read<ProviderPrueba>().addLetter('b');
              });
            },
            onTap: () {
              setState(() {
                context.read<ProviderPrueba>().addLetter('c');
              });
            },
          ),
        ],
      ),
    );
  }
}
