import 'package:bla_bla_car_clone/ui/screens/home/home_page.dart';
import 'package:bla_bla_car_clone/ui/utils/colors.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: ThemeColors.backgroundColor,
      ),
      home: HomePage(),
    );
  }
}
