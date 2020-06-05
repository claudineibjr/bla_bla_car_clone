import 'package:bla_bla_car_clone/ui/screens/messages/messages_screen.dart';
import 'package:bla_bla_car_clone/ui/screens/offer/offer_ride_screen.dart';
import 'package:bla_bla_car_clone/ui/screens/profile/profile_screen.dart';
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
      MessagesScreen(),
      ProfileScreen(),
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
            icon: Icon(Icons.format_quote), // mdi-wechat
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
            icon: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Icon(Icons.forum),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 14,
                      minWidth: 14,
                    ),
                    child: Text(
                      '8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            title: Text('Mensagens'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('Perfil'),
          ),
        ],
      ),
      body: screens[currentTabIndex],
    );
  }
}
