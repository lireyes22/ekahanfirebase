import 'package:ekahanfirebase/screens/views/models/divierli.dart';
import 'package:ekahanfirebase/screens/views/models/model_card_two.dart';
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
          height: 130,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              ModelCardRow(),
              ModelCardRow(),
              ModelCardRow(),
              ModelCardRow(),
              ModelCardRow(),
              ModelCardRow(),
              ModelCardRow(),
              ModelCardRow(),
              ModelCardRow(),
            ],
          ),
        ),
        const DividerLi(
          color: Color.fromARGB(55, 0, 0, 0),
          tm: 1,
        ),
        const ModelCard(),
        const ModelCard(),
        const ModelCard(),
        const ModelCard(),
        const ModelCard(),
        const ModelCard(),
        const ModelCard(),
        const ModelCard(),
      ],
    );
  }
}
