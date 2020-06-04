import 'package:bla_bla_car_clone/ui/screens/offer/offer_ride_screen.dart';
import 'package:bla_bla_car_clone/ui/screens/rides/rides_screen.dart';
import 'package:bla_bla_car_clone/ui/screens/search/search_screen.dart';
import 'package:bla_bla_car_clone/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex;

  List<Widget> screens;

  @override
  void initState() {
    super.initState();
    currentTabIndex = 0;

    screens = [
      RidesScreen(),
      SearchScreen(),
      OfferRideScreen(),
      Center(
        child: Text('Tela 4'),
      ),
      Center(
        child: Text('Tela 5'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (int index) {
          if (index != 2) {
            setState(() => currentTabIndex = index);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => OfferRideScreen(),
              ),
            );
          }
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: ThemeColors.mainColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.forum), // mdi-wechat
            title: Text('Caronas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Procurar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text('Oferecer'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Mensagens'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Perfil'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 15.0,
          ),
          child: screens[currentTabIndex],
        ),
      ),
    );
  }
}
