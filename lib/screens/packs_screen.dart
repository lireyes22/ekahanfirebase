import 'package:ekahanfirebase/Widgets/search_field.dart';
import 'package:ekahanfirebase/screens/views_pack/packages_view.dart';
import 'package:flutter/material.dart';

class PacksScreen extends StatefulWidget {
  static const String routeName = '/pack';
  const PacksScreen({super.key});

  @override
  State<PacksScreen> createState() => _PacksScreenState();
}

class _PacksScreenState extends State<PacksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: const <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SearchField(
                  txt: 'Search packages',
                ),
                ListPackages(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
