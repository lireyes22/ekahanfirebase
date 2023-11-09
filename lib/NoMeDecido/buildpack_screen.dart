// ignore_for_file: unused_field, avoid_unnecessary_containers

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:ekahanfirebase/NoMeDecido/views_buildpack/hotels_view.dart';
import 'package:ekahanfirebase/NoMeDecido/views_buildpack/restaurants_view.dart';
import 'package:ekahanfirebase/NoMeDecido/views_buildpack/stations_view.dart';
import 'package:ekahanfirebase/NoMeDecido/views_buildpack/touristplaces_view.dart';
import 'package:ekahanfirebase/NoMeDecido/views_buildpack/transports_view.dart';
import 'package:flutter/material.dart';

class BuildPackScreen extends StatefulWidget {
  const BuildPackScreen({Key? key}) : super(key: key);
  static const String routeName = '/buildpack';

  @override
  State<BuildPackScreen> createState() => _BuildPackScreenState();
}

class _BuildPackScreenState extends State<BuildPackScreen> {
  //Establece la pagina que se ve de fondo
  final _pageController = PageController(initialPage: 2);

  ///Establece el icono que esta seleccionado
  final _controller = NotchBottomBarController(index: 2);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> pagesViews = [
    const StationsView(),
    const TransportsView(),
    const HotelsView(),
    const RestaurantsView(),
    const TouristPlacesView(),
  ];

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).colorScheme.primaryContainer;
    Color bgNotch = Colors.white;
    Color active = Theme.of(context).colorScheme.primaryContainer;
    Color inactive = Theme.of(context).colorScheme.primaryContainer;

    return Scaffold(
      backgroundColor: bg,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:
            List.generate(pagesViews.length, (index) => pagesViews[index]),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: bgNotch,
        showLabel: false,
        notchColor: bgNotch,

        /// restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          BottomBarItem(
            itemLabel: 'Page 1',
            inActiveItem: Icon(
              Icons.train,
              color: active,
            ),
            activeItem: Icon(
              Icons.train,
              color: inactive,
            ),
          ),
          BottomBarItem(
            itemLabel: 'Page 2',
            inActiveItem: Icon(
              Icons.car_rental,
              color: active,
            ),
            activeItem: Icon(
              Icons.car_rental,
              color: inactive,
            ),
          ),
          BottomBarItem(
            itemLabel: 'Page 3',
            inActiveItem: Icon(
              Icons.hotel,
              color: active,
            ),
            activeItem: Icon(
              Icons.hotel,
              color: inactive,
            ),
          ),
          BottomBarItem(
            itemLabel: 'Page 4',
            inActiveItem: Icon(
              Icons.restaurant,
              color: active,
            ),
            activeItem: Icon(
              Icons.restaurant,
              color: inactive,
            ),
          ),
          BottomBarItem(
            itemLabel: 'Page 5',
            inActiveItem: Icon(
              Icons.place,
              color: active,
            ),
            activeItem: Icon(
              Icons.place,
              color: inactive,
            ),
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
