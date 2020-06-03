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
      Center(
        child: Text('Tela 1'),
      ),
      Center(
        child: Text('Tela 2'),
      ),
      Center(
        child: Text('Tela 3'),
      ),
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
        onTap: (int index) => setState(() => currentTabIndex = index),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: ThemeColors.mainColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Caronas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Procurar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
          padding: EdgeInsets.only(
            top: 20.0,
            left: 15.0,
          ),
          child: screens[currentTabIndex],
        ),
      ),
    );
  }
}
