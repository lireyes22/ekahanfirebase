import 'package:ekahanfirebase/screens/views/models/divierli.dart';
import 'package:ekahanfirebase/screens/views/models/text_with_configs.dart';
import 'package:flutter/material.dart';

import 'models/model_card.dart';
import 'models/search_field.dart';
import 'models/title_separator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SearchField(),
        const TitleSeparator(title: 'Recommended places'),
        SizedBox(
          height: 170,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              ModelCard(
                widthM: 325,
                textWidgets: [
                  TextWithConfigs(text: 'Texto 1'),
                  TextWithConfigs(text: 'Texto 2'),
                ],
              ),
            ],
          ),
        ),
        const DividerLi(
          color: Color.fromARGB(55, 0, 0, 0),
          tm: 1,
        ),
        const ModelCard(
          textWidgets: [
            TextWithConfigs(text: 'Texto 1'),
            TextWithConfigs(text: 'Texto 2'),
            TextWithConfigs(text: 'Texto 3'),
          ],
        ),
      ],
    );
  }
}
