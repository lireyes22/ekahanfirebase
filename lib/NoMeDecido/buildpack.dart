import 'package:flutter/material.dart';

class BuildPackScreen extends StatefulWidget {
  const BuildPackScreen({Key? key}) : super(key: key);
  static const String routeName = '/buildpack';

  @override
  State<BuildPackScreen> createState() => _BuildPackScreenState();
}

class _BuildPackScreenState extends State<BuildPackScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const Center(child: Text('Página 1')),
    const Center(child: Text('Página 2')),
    const Center(child: Text('Página 3')),
    const Center(child: Text('Página 4')),
    const Center(child: Text('Página 5')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationRail Example'),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Página 1'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('Página 2'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Página 3'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Página 4'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Página 5'),
              ),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
