import 'package:bla_bla_car_clone/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Para onde você quer ir?',
            style: TextStyle(
              color: ThemeColors.secondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          TextFormField(
            initialValue: '',
            decoration: InputDecoration(
              isDense: true,
              hintText: 'De (endereço completo)',
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: '',
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Para (endereço completo)',
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hoje, 11:00',
                  style: TextStyle(
                    color: ThemeColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '1 passageiro',
                  style: TextStyle(
                    color: ThemeColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.schedule,
                  color: Colors.grey[500],
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: ThemeColors.secondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(text: 'Garça, SP, 17400-000, Brasil '),
                            WidgetSpan(
                              child: Icon(
                                Icons.trending_flat,
                                color: ThemeColors.secondaryColor,
                              ),
                            ),
                            TextSpan(text: ' São Carlos, Sp, Brasil'),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '4 passageiros',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
