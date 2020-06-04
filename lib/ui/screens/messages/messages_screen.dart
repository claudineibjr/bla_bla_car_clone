import 'package:bla_bla_car_clone/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int currentTabIndex;

  @override
  void initState() {
    currentTabIndex = 0;

    super.initState();
  }

  Widget messageCard() {
    return Padding(
      padding: EdgeInsets.only(
        left: 5,
        right: 5,
        bottom: 15,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 5),
          Icon(
            Icons.mail_outline,
            color: Colors.grey[400],
            size: 32,
          ),
          SizedBox(width: 25),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'João Vitor',
                      style: TextStyle(
                        color: ThemeColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Sáb. 30 mai - 20:49',
                      style: TextStyle(
                        color: ThemeColors.secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'São Carlos >> Garça',
                  style: TextStyle(
                    color: ThemeColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Dom. 31 mai - 09:00',
                  style: TextStyle(
                    color: ThemeColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationCard() {
    return Padding(
      padding: EdgeInsets.only(
        left: 5,
        right: 5,
        bottom: 15,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 5),
          Icon(
            Icons.star,
            color: Colors.grey[400],
            size: 32,
          ),
          SizedBox(width: 25),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Fazer avaliação',
                  style: TextStyle(
                    color: ThemeColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Depois da carona São Carlos-Bauru, faça uma avaliação de Juliana',
                  style: TextStyle(
                    color: ThemeColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.close,
            color: Colors.grey[800],
            size: 32,
          ),
        ],
      ),
    );
  }

  List<Widget> getWidgets() {
    List<Widget> widgets = [];

    if (currentTabIndex == 0) {
      widgets.add(messageCard());
      widgets.add(messageCard());

      widgets.add(
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(
                color: ThemeColors.mainColor,
              ),
            ),
            color: ThemeColors.mainColor,
            onPressed: () {},
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              'Ver mais'.toUpperCase(),
              style: TextStyle(color: ThemeColors.backgroundColor),
            ),
          ),
        ),
      );
    } else if (currentTabIndex == 1) {
      widgets.add(notificationCard());
      widgets.add(notificationCard());
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensagens'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DefaultTabController(
              length: 2,
              child: TabBar(
                onTap: (int index) => setState(() => currentTabIndex = index),
                labelColor: ThemeColors.secondaryColor,
                tabs: [
                  Tab(
                    text: 'Mensagens'.toUpperCase(),
                  ),
                  Tab(
                    // text: 'Notificações'.toUpperCase(),
                    child: Row(
                      children: <Widget>[
                        Text('Notificações'.toUpperCase()),
                        SizedBox(width: 6),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            maxHeight: 20,
                            minWidth: 14,
                          ),
                          child: Center(
                            child: Text(
                              '8',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
