import 'package:bla_bla_car_clone/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class RidesScreen extends StatefulWidget {
  @override
  _RidesScreenState createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  Widget getCard() {
    return Card(
      color: Colors.grey[50],
      shadowColor: ThemeColors.secondaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: ThemeColors.mainColor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Fazer avaliação',
                    style: TextStyle(
                      color: ThemeColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Sáb 30 mai, 14:00',
              style: TextStyle(
                color: ThemeColors.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ThemeColors.secondaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 4,
                      decoration:
                          BoxDecoration(color: ThemeColors.secondaryColor),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ThemeColors.secondaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // TODO: Adjust this
                    Text(
                      'Garça',
                      style: TextStyle(
                        color: ThemeColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'São Carlos',
                      style: TextStyle(
                        color: ThemeColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Stack(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('assets/image/profile-image.png'),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: CircleAvatar(
                    child: Image.asset('assets/image/profile-image.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildCards() {
    List<Widget> cards = [];

    cards.add(getCard());
    cards.add(getCard());

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 15.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Suas caronas',
                  style: TextStyle(
                    color: ThemeColors.secondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
              ]
                ..addAll(buildCards())
                ..addAll(
                  [
                    SizedBox(height: 10),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Ver caronas arquivadas',
                            style: TextStyle(
                              color: ThemeColors.secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: ThemeColors.secondaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
