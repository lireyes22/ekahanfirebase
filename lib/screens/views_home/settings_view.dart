import 'package:ekahanfirebase/screens/views_home/models/divierli.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.0, color: Colors.grey[200]!),
          ),
          child: const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/mochila2.jpg'),
            ),
            title: Text('¡Hello traveler!'),
            subtitle: Text('Alessandro Luizao Reyes Varguez'),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.0, color: Colors.grey[200]!),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  child: Container(
                    color: Colors.white,
                    child: const ListTile(
                      leading: Icon(Icons.person_2),
                      title: Text('Profile'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
              const DividerLi(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  child: Container(
                    color: Colors.white,
                    child: const ListTile(
                      leading: Icon(Icons.favorite_border_outlined),
                      title: Text('Favorites'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
              const DividerLi(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  child: Container(
                    color: Colors.white,
                    child: const ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 550),
      ],
    );
  }
}
