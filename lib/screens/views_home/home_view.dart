import 'package:ekahanfirebase/screens/views_home/objects/list_lugares.dart';
import 'package:ekahanfirebase/screens/views_home/objects/list_recomendados.dart';
import 'package:flutter/material.dart';
import 'models/search_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SearchField(),
        //TitleSeparator(title: 'Recommended places'),
        ListRecomendados(),
        //DividerLi(color: Color.fromARGB(85, 0, 0, 0), tm: 5),
        ListLugares(),
      ],
    );
  }
}
