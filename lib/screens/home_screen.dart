import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ekahanfirebase/screens/views_home/home_view.dart';
import 'package:ekahanfirebase/screens/views_home/settings_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
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
              child: Icon(Icons.manage_accounts),
              labelStyle: TextStyle(color: Colors.black),
              label: 'Account',
            ),
            CurvedNavigationBarItem(
              //Barra de home
              child: Icon(Icons.home_outlined),
              labelStyle: TextStyle(color: Colors.black),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              //Barra de Plan vigente
              child: Icon(Icons.list_alt),
              labelStyle: TextStyle(color: Colors.black),
              label: 'History',
            ),
          ],
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        body: SafeArea(
            child: <Widget>[
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: const <Widget>[
              SettingsView(),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: const <Widget>[
              HomeView(),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Page Route'),
          ),
        ][currentPageIndex]));
  }
}
