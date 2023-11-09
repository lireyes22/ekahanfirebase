import 'package:ekahanfirebase/screens/views_info_lugar/info_lugar_view.dart';
import 'package:flutter/material.dart';

class InfoLugarScreen extends StatefulWidget {
  static const String routeName = '/infolugar';
  const InfoLugarScreen({super.key});

  @override
  State<InfoLugarScreen> createState() => _InfoLugarScreenState();
}

class _InfoLugarScreenState extends State<InfoLugarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: const Padding(
                          padding: EdgeInsets.all(20), child: InfoLugarView()),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
