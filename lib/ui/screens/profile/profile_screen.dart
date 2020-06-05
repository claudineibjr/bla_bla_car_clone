import 'package:bla_bla_car_clone/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentTabIndex;

  @override
  void initState() {
    currentTabIndex = 0;

    super.initState();
  }

  List<Widget> getWidgets() {
    List<Widget> widgets = [];

    if (currentTabIndex == 0) {
      widgets.add(Text('Hello World - 1'));
    } else if (currentTabIndex == 1) {
      widgets.add(Text('Hello World - 2'));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: ThemeColors.mainColor,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              // height: 200,
              color: ThemeColors.mainColor,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          backgroundImage: AssetImage(
                            'assets/image/people/person1.png',
                          ),
                          radius: 30,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: PopupMenuButton<String>(
                            onSelected: (String result) {},
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            color: Colors.white,
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: '1',
                                child: Text(
                                  'Modificar Foto',
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: '2',
                                child: Text(
                                  'Modificar Detalhes',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Claudinei',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Avançado',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: TabBar(
                      onTap: (int index) =>
                          setState(() => currentTabIndex = index),
                      // labelColor: ThemeColors.mainColor,
                      indicatorColor: ThemeColors.backgroundColor,
                      tabs: [
                        Tab(
                          text: 'Detalhes'.toUpperCase(),
                        ),
                        Tab(
                          text: 'Conta'.toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 15.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: getWidgets(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
