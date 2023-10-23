import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ekahanfirebase/screens/views/home_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 1;
  bool first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white, //Color de fondo de la barra
        buttonBackgroundColor: Theme.of(context)
            .colorScheme
            .primaryContainer, //Color de la bolita del icono
        backgroundColor: Theme.of(context)
            .colorScheme
            .primaryContainer, //Del fondo cuando esta seleccionado
        items: const [
          CurvedNavigationBarItem(
            //Barra de configuraciones
            child: Icon(Icons.settings),
            labelStyle: TextStyle(color: Colors.black),
            label: 'Settings',
          ),
          CurvedNavigationBarItem(
            //Barra de home
            child: Icon(Icons.home_outlined),
            labelStyle: TextStyle(color: Colors.black),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            //Barra de Plan vigente
            child: Icon(Icons.alt_route),
            labelStyle: TextStyle(color: Colors.black),
            label: 'Route',
          ),
        ],
        onTap: (index) {
          setState(() {
            if (first) {
              first = false;
              currentPageIndex = 1;
            } else {
              currentPageIndex = index;
            }
          });
        },
      ),
      body: <Widget>[
        ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: const <Widget>[
            HomeView(),
          ],
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}
